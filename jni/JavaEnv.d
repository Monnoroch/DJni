module jni.JavaEnv;

import std.stdio;
import std.algorithm;

import jni.jni;
import jni.JavaVM;
import jni.JavaClass;


struct JavaEnv {
public:
	// construct from scratch
	this(JNIEnv * env) {
		val = env;
	}

	// default constructor emulation
	static JavaEnv opCall() {
		return JavaEnv(null);
    }

	JNIEnv * Val() {
		return val;
	}

	const(JNIEnv) * Val() const {
		return val;
	}

	bool Valid() const {
		return val != null;
	}

	bool opEquals(JavaEnv env) const {
		return opEquals(env);
	}

	bool opEquals(ref const(JavaEnv) env) const {
		return val == env.val;
	}

	jint Version() const {
		return val.GetVersion();
	}

	JniJavaVM GetVM() const {
		JavaVM * vm;
		if(val.GetJavaVM(&vm) != 0) {
			writeln("Error: cannot get JavaVM from JNIEnv!");
			return JniJavaVM(); // return invalid
		}
		return JniJavaVM(vm, Version());
	}

	JavaClass FindClass(string str) {
		return JavaClass(this, str);
	}

private:
	JNIEnv * val;
}
