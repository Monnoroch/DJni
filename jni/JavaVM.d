module jni.JavaVM;

import std.stdio;
import std.algorithm;

import jni.jni;
import jni.JavaEnv;


struct JniJavaVM {
public:
	static const jint JNI_DEFAULT_VERSION = JNI_VERSION_1_6;

	// construct from scratch
	this(JavaVM * v, jint ver = JNI_DEFAULT_VERSION) {
		val = v;
		_version = ver;
		doDestroy = false;
	}

	// construct from scratch
	this(jint ver) {
		val = null;
		_version = ver;
		doDestroy = true;
		JNIEnv * env;
		JavaVMInitArgs args;
		args._version = _version;
		args.nOptions = 0;
		if(JNI_CreateJavaVM(&val, cast(void**) &env, &args) != 0) {
			writeln("Error: cannot create JavaVM!");
		}
	}

	this(string classPath, jint ver = JNI_DEFAULT_VERSION) {
		val = null;
		_version = ver;
		doDestroy = true;
		JNIEnv * env;
		JavaVMInitArgs args;
		args._version = _version;
		JavaVMOption options[1];
		args.nOptions = 1;
		string argCP = "-Djava.class.path=" ~ classPath;
		options[0].optionString = cast(char*) std.string.toStringz(argCP);
		args.options = options.ptr;
		if(JNI_CreateJavaVM(&val, cast(void**) &env, &args) != 0) {
			writeln("Error: cannot create JavaVM!");
		}
	}

	// postblit
	this(this) {
		doDestroy = false;
	}

	// move from rvalue
	this(JniJavaVM v) {
		val = v.val;
		_version = v._version;
		doDestroy = v.doDestroy;
		v.doDestroy = false; // we stole the ownership
	}

	// copy from lvalue
	this(ref const(JniJavaVM) v) {
		val = cast(JavaVM*) v.val;
		_version = v._version;
		doDestroy = false;
	}

	// destructor
	~this() {
		Destroy();
	}

	// default constructor emulation
	static JniJavaVM opCall() {
		return JniJavaVM(JNI_DEFAULT_VERSION);
    }

	// swap with rvalue
	ref JniJavaVM opAssign(JniJavaVM v) {
		swap(val, v.val);
		swap(_version, v._version);
		swap(doDestroy, v.doDestroy);
		return this;
	}

	// destroy and copy from lvalue
	ref JniJavaVM opAssign(ref const(JniJavaVM) v) {
		Destroy();
		val = cast(JavaVM*) v.val;
		_version = v._version;
		doDestroy = false;
		return this;
	}

	JavaVM * Val() {
		return val;
	}

	const(JavaVM) * Val() const {
		return val;
	}

	jint Version() const {
		return _version;
	}

	bool Valid() const {
		return val != null;
	}

	bool opEquals(JniJavaVM vm) const {
		return opEquals(vm);
	}

	bool opEquals(ref const(JniJavaVM) vm) const {
		return val == vm.val;
	}

	JavaEnv GetEnv() const {
		JNIEnv * env = null;
		JavaVMAttachArgs attachArgs;

		jint res = val.GetEnv(cast(void**) &env, Version());
		switch(res) {
			case JNI_OK:
				break;
			case JNI_EDETACHED:
				attachArgs._version = Version();
				attachArgs.name = cast(char*) std.string.toStringz("");
				attachArgs.group = null;
				res = val.AttachCurrentThread(cast(void**) &env, &attachArgs);
				if(res != JNI_OK) {
					writeln("getJNIEnv: failed to attach to current thread.");
					return JavaEnv();
				}
				break;
			case JNI_EVERSION:
				writeln("getJNIEnv: Unsupported JNI version.");
				return JavaEnv();
			default:
				writeln("getJNIEnv: JNI API error.");
				return JavaEnv();
		}
		return JavaEnv(env);
	}

private:
	JavaVM * val;
	jint _version;
	bool doDestroy;

	void Destroy() {
		if(doDestroy && Valid()) {
			val.DestroyJavaVM();
			val = null;
		}
	}
}
