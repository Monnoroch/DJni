module jni.JavaClass;

import std.stdio;
import std.algorithm;

import jni.jni;
import jni.JniProxy;
import jni.JavaEnv;
import jni.JavaObject;
import jni.JavaMethod;
import jni.JavaField;


struct JavaClass {
public:
	static JavaClass opCall() {
		writefln("%s", __FUNCTION__);
		return JavaClass(JavaEnv(), cast(jclass) null);
	}

	this(JavaEnv env, jclass c) {
		writefln("%s(JavaEnv, jclass)", __FUNCTION__);
		base.__ctor(env, c);
	}

	this(JavaEnv env, string val) {
		writefln("%s(JavaEnv, string)", __FUNCTION__);
		this(env, GetClass(env, val));
	}

	this(JavaClass cls) {
		writefln("%s(JavaClass)", __FUNCTION__);
		swap(base, cls.base);
		cls.base = JavaObject();
	}

	this(ref JavaClass cls) {
		writefln("%s(ref JavaClass)", __FUNCTION__);
		base.__ctor(cls.base);
	}

	this(this) {
		writefln("%s", __FUNCTION__);
	}

	~this() {
		writefln("%s", __FUNCTION__);
	}

	// swap with rvalue
	ref JavaClass opAssign(JavaClass v) {
		writefln("%s(JavaClass)", __FUNCTION__);
		swap(base, v.base);
		return this;
	}

	// destroy and copy from lvalue
	ref JavaClass opAssign(ref JavaClass v) {
		writefln("%s(ref JavaClass)", __FUNCTION__);
		base.opAssign(v.base);
		return this;
	}

	bool opEquals(ref const(JavaClass) cls) const {
		writefln("%s(ref JavaClass)", __FUNCTION__);
		return base == cls.base;
	}

	bool opEquals(string str) const {
		return _obj == GetClass(Env(), str);
	}

	jclass Val() const {
		return cast(jclass) base.Val();
	}

	JavaClass Superclass() const {
		return FromJavaProxy!JavaClass(Env(), Env().Val().GetSuperclass(Val())).Val();
	}

	jboolean IsAssignableFrom(JavaClass cls) const {
		return IsAssignableFrom(cls);
	}

	jboolean IsAssignableFrom(ref const(JavaClass) cls) const {
		return Env().Val().IsAssignableFrom(Val(), cls.Val());
	}

	JavaMethod!T GetMethod(T)(ref JavaObject obj, string name) const {
		return JavaMethod!T(obj, Env().Val().GetMethodID(Val(), std.string.toStringz(name), std.string.toStringz(JniSignatureBuilder!T.Sign)));
	}

	JavaStaticMethod!T GetStaticMethod(T)(string name) {
		return JavaStaticMethod!T(this, Env().Val().GetStaticMethodID(Val(), std.string.toStringz(name), std.string.toStringz(JniSignatureBuilder!T.Sign)));
	}

	// somehow in JNI constructor is not a static method.
	// i made it static just for sanity
	JavaStaticMethod!T GetConstructor(T)() {
		return JavaStaticMethod!T(this, Env().Val().GetMethodID(Val(), std.string.toStringz("<init>"), std.string.toStringz(JniSignatureBuilder!T.Sign)));
	}

	JavaStaticMethod!(void function()) GetDefaultConstructor() {
		return GetConstructor!(void function())();
	}

	JavaField!T GetField(T)(ref JavaObject obj, string name) const {
		return JavaField!T(this, Env().Val().GetFieldID(Val(), std.string.toStringz(name), std.string.toStringz(JniSignatureBuilder!T.Sign)));
	}

	JavaStaticField!T GetStaticField(T)(string name) {
		return JavaStaticField!T(this, Env().Val().GetStaticFieldID(Val(), std.string.toStringz(name), std.string.toStringz(JniSignatureBuilder!T.Sign)));
	}

	T GetStaticFieldValue(T)(string name) {
		return GetStaticField!T(name).Get();
	}

	JavaObject NewObject(T : R function(As), R, As...)(As args) {
		return FromJavaProxy!JavaObject(Env(), Env().Val().NewObject(Val(), GetConstructor!T().Val(), ToJavaProxy(Env(), args).Val())).Val();
	}

	JavaObject base;
	alias base this;

private:
	static jclass GetClass(JavaEnv env, string name) {
		if(!env.Valid()) {
			writeln("Cannot load class ", name, ", broken JavaEnv.");
			return null;
		}

		auto cls = env.Val().FindClass(std.string.toStringz(std.array.replace(name, ".", "/")));
		if(cls is null) {
			writeln("Cannot find class ", name, ".");
		}

		return cls;
	}
}
