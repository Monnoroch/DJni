module jni.JavaString;

import std.stdio;
import std.algorithm;

import jni.jni;
import jni.JavaEnv;
import jni.JavaObject;


struct JavaString {
public:
	static JavaString opCall() {
		writefln("%s", __FUNCTION__);
		return JavaString(JavaEnv(), cast(jstring) null);
	}

	this(JavaEnv env, jstring c) {
		writefln("%s(JavaEnv, jstring)", __FUNCTION__);
		base.__ctor(env, c);
		Init();
	}

	this(JavaEnv env, string _val) {
		writefln("%s(JavaEnv, string)", __FUNCTION__);
		this(env, env.Val().NewStringUTF(std.string.toStringz(_val)));
	}

	this(JavaString str) {
		writefln("%s(JavaString)", __FUNCTION__);
		swap(base, str.base);
		swap(val, str.val);
		str.base = JavaObject();
		str.val = null;
	}

	this(ref JavaString str) {
		writefln("%s(ref JavaString)", __FUNCTION__);
		base.__ctor(str.base);
		Init();
	}

	this(this) {
		writefln("%s", __FUNCTION__);
	}

	~this() {
		writefln("%s", __FUNCTION__);
	}

	// swap with rvalue
	ref JavaString opAssign(JavaString v) {
		writefln("%s(JavaString)", __FUNCTION__);
		swap(base, v.base);
		swap(val, v.val);
		return this;
	}

	// destroy and copy from lvalue
	ref JavaString opAssign(ref JavaString v) {
		writefln("%s(ref JavaString)", __FUNCTION__);
		base.opAssign(v.base);
		val = v.val;
		return this;
	}

	bool opEquals(ref const(JavaString) str) const {
		writefln("%s(ref JavaString)", __FUNCTION__);
		return base == str.base || val == str.val;
	}

	bool opEquals(string str) const {
		return val == str;
	}


	jstring Val() const { return cast(jstring) _obj; }

	string Value() const {
		return val;
	}

	jsize Length() const {
		return _env.Val().GetStringLength(Val());
	}

	jsize Size() const {
		return _env.Val().GetStringUTFLength(Val());
	}

	char opIndex(uint n) const {
		return val[n];
	}

	JavaObject base;
	alias base this;

private:
	string val;

	void Init() {
		if(Valid()) {
			const(char) * tmp = _env.Val().GetStringUTFChars(Val(), null);
			val = std.conv.to!string(tmp);
			_env.Val().ReleaseStringUTFChars(Val(), tmp);
		}
	}

	void Destroy() {
		//if(Valid())
		//	_env.Val().ReleaseStringUTFChars(Val(), val);
	}

protected:
	void Reset(ref const(JavaString) str) {
		Destroy();
		base.Reset(str);
		Init();
	}
}
