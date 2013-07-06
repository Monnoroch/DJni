module jni.JavaObject;

import std.stdio;
import std.algorithm;

import jni.jni;
import jni.JniProxy;
import jni.JavaEnv;
import jni.JavaClass;
import jni.JavaMethod;
import jni.JavaField;


version = MSYM_DEBUG_JNI_REF_CNT;
 
version(MSYM_DEBUG_JNI_REF_CNT) {
	int globalRefCnt = 0;
	int maxGlobalRefCnt = 0;
}


struct JavaObject {
public:
	static JavaObject opCall() {
		writefln("%s", __PRETTY_FUNCTION__);
		return JavaObject(JavaEnv(), null);
	}

	this(JavaEnv env, jobject o) {
		writefln("%s(JavaEnv, jobject)", __FUNCTION__);
		_env = env;
		_obj = o;
		version(MSYM_DEBUG_JNI_REF_CNT) {
			if(Valid()) {
				maxGlobalRefCnt++;
				globalRefCnt++;
			}
		}
	}

	this(JavaObject o) {
		writefln("%s(JavaObject)", __FUNCTION__);
		_env = o._env;
		_obj = o._obj;
		o._env = JavaEnv();
		o._obj = null;
	}

	this(ref JavaObject o) {
		writefln("%s(ref JavaObject)", __FUNCTION__);
		Init(o);
	}

	this(this) {
		writefln("%s", __FUNCTION__);
		Init(this);
	}

	~this() {
		writefln("%s", __FUNCTION__);
		Destroy();
	}

	// swap with rvalue
	ref JavaObject opAssign(JavaObject v) {
		writefln("%s(JavaObject)", __FUNCTION__);
		swap(_env, v._env);
		swap(_obj, v._obj);
		return this;
	}

	// destroy and copy from lvalue
	ref JavaObject opAssign(ref JavaObject v) {
		writefln("%s(ref JavaObject)", __FUNCTION__);
		Reset(v);
		return this;
	}

	bool opEquals(ref const(JavaObject) v) const {
		writefln("%s(ref const(JavaObject))", __FUNCTION__);
		return Env().Val().IsSameObject(Val(), v.Val()) == JNI_TRUE;
	}

//	static JavaObject New(const JavaClass& cls);
//	static JavaObject New(JavaEnv env, const std::string& cls);

//	template<typename R, typename ... Args>
//	static JavaObject New(const JavaClass& cls, Args&& ... args);

//	template<typename T>
//	static JavaObject New(JavaEnv env, const std::string& cls);


	JavaClass GetClass() const {
		return FromJavaProxy!JavaClass(Env(), Env().Val().GetObjectClass(Val())).Val();
	}

	bool Valid() const { return _env.Valid() && _obj !is null; }
	JavaEnv Env() const { return cast(JavaEnv) _env; }

	jobject Val() const { return cast(jobject) _obj; }

	jint MonitorEnter() const {
		return _env.Val().MonitorEnter(Val());
	}

	jint MonitorExit() const {
		return _env.Val().MonitorExit(Val());
	}

	JavaMethod!T GetMethod(T)(string name) {
		return GetClass().GetMethod!T(this, name);
	}

	JavaField!T GetField(T)(string name) {
		return GetClass().GetField!T(this, name);
	}

	T GetFieldValue(T)(string name) {
		return GetField!T(name).Get();
	}

package:
	void Reset(ref const(JavaObject) o) {
		Destroy();
		Init(o);
	}

private:
	void Init(ref const(JavaObject) o) {
		_env = cast(JavaEnv) o._env;
		if(o.Valid()) {
			version(MSYM_DEBUG_JNI_REF_CNT) {
				maxGlobalRefCnt++;
				globalRefCnt++;
			}
			_obj = _env.Val().NewLocalRef(cast(jobject) o._obj);
		}
	}

	void Destroy() {
		if(Valid()) {
			version(MSYM_DEBUG_JNI_REF_CNT)
				globalRefCnt--;
			_env.Val().DeleteLocalRef(_obj);
		}
	}

package:
	JavaEnv _env;
	jobject _obj;
}

struct JavaBoolean {
public:
	static JavaBoolean opCall() {
		writefln("%s", __PRETTY_FUNCTION__);
		return JavaBoolean(JavaEnv(), null);
	}
	this(JavaEnv env, jobject c) {
		writefln("%s(JavaEnv, jobject)", __FUNCTION__);
		base.__ctor(env, c);
	}

	this(JavaBoolean cls) {
		writefln("%s(JavaBoolean)", __FUNCTION__);
		swap(base, cls.base);
		cls.base = JavaObject();
	}

	this(ref JavaBoolean cls) {
		writefln("%s(ref JavaBoolean)", __FUNCTION__);
		base.__ctor(cls.base);
	}

	this(this) {
		writefln("%s", __FUNCTION__);
	}

	~this() {
		writefln("%s", __FUNCTION__);
	}

	// swap with rvalue
	ref JavaBoolean opAssign(JavaBoolean v) {
		writefln("%s(JavaBoolean)", __FUNCTION__);
		swap(base, v.base);
		return this;
	}

	// destroy and copy from lvalue
	ref JavaBoolean opAssign(ref JavaBoolean v) {
		writefln("%s(ref JavaBoolean)", __FUNCTION__);
		base.opAssign(v.base);
		return this;
	}
	JavaObject base;
	alias base this;
}
