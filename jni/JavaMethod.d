module jni.JavaMethod;

import std.algorithm;
import std.typetuple;

import jni.jni;
import jni.JniProxy;
import jni.JavaEnv;
import jni.JavaObject;
import jni.JavaClass;


private {
	template Fun(size_t i, T) {
		alias Fun = TypeTuple!(std.string.format(", ToJavaProxy!(As[%d])(Env(), args[%d]).Val()", i, i));
	}

	template ConcatStrings() {
		const Val = "";
	}

	template ConcatStrings(T, As...) if(!is(T == string)) {
		static assert(T);
	}

	template ConcatStrings(string s, As...) {
		const Val = s ~ ConcatStrings!As.Val;
	}
}

struct JavaMethod(T : R function(As), R, As...) {
public:
	//static JavaMethod opCall() {
	//	return JavaMethod(JavaObject(), null);
	//}

	this(JavaObject obj, jmethodID mid) {
		_obj = obj;
		_val = mid;
	}

	this(JavaMethod m) {
		swap(_obj, m._obj);
		swap(_val, m._val);
		m._obj = JavaObject();
		m._val = null;
	}

	this(ref JavaMethod m) {
		_obj.__ctor(m._obj);
		_val = m._val;
	}

	ref JavaMethod opAssign(JavaMethod m) {
		swap(_obj, m._obj);
		swap(_val, m._val);
		return this;
	}

	ref JavaMethod opAssign(ref JavaMethod m) {
		_obj = m._obj;
		_val = m._val;
		return this;
	}

	bool opEquals(ref const(JavaMethod) m) const {
		return _obj == m._obj && _val == m._val;
	}

	jmethodID Val() const {
		return cast(jmethodID) _val;
	}

	JavaEnv Env() const {
		return _obj.Env();
	}

	bool Valid() const {
		return _obj.Valid() && _val !is null;
	}

	ref const(JavaObject) GetObject() const {
		return _obj;
	}

	JavaClass GetClass() const {
		return GetObject().GetClass();
	}

	static if(IsPrimitiveJniType!R.Val) {
		R opCall(As args) const {
			mixin("return Env().Val().Call" ~ JniFuncTypeName!R.Name ~ "Method(GetObject().Val(), Val()" ~
				ConcatStrings!(staticIndexedMap!(Fun, As)).Val ~
			");");
		}
	}
	else {
		R opCall(As args) const {
			mixin("return FromJavaProxy!R(Env(), Env().Val().CallObjectMethod(GetObject().Val(), Val()" ~
				ConcatStrings!(staticIndexedMap!(Fun, As)).Val ~
			")).Val();");
		}
	}

private:
	JavaObject _obj;
	jmethodID _val;
}

struct JavaStaticMethod(T : R function(As), R, As...) {
public:
	//static JavaStaticMethod opCall() {
	//	return JavaStaticMethod(JavaClass(), null);
	//}

	this(JavaClass cls, jmethodID mid) {
		_cls = cls;
		_val = mid;
	}

	this(JavaStaticMethod m) {
		swap(_cls, m._cls);
		swap(_val, m._val);
		m._cls = JavaClass();
		m._val = null;
	}

	this(ref JavaStaticMethod m) {
		_cls.__ctor(m._cls);
		_val = m._val;
	}

	ref JavaStaticMethod opAssign(JavaStaticMethod m) {
		swap(_cls, m._cls);
		swap(_val, m._val);
		return this;
	}

	ref JavaStaticMethod opAssign(ref JavaStaticMethod m) {
		_cls = m._cls;
		_val = m._val;
		return this;
	}

	bool opEquals(ref const(JavaStaticMethod) m) const {
		return _cls == m._cls && _val == m._val;
	}

	jmethodID Val() const {
		return cast(jmethodID) _val;
	}

	JavaEnv Env() const {
		return _cls.Env();
	}

	bool Valid() const {
		return _cls.Valid() && _val !is null;
	}

	ref const(JavaClass) GetClass() const {
		return _cls;
	}

	static if(IsPrimitiveJniType!R.Val) {
		R opCall(As args) const {
			mixin("return Env().Val().CallStatic" ~ JniFuncTypeName!R.Name ~ "Method(GetClass().Val(), Val()" ~
				ConcatStrings!(staticIndexedMap!(Fun, As)).Val ~
			");");
		}
	}
	else {
		R opCall(As args) const {
			mixin("return FromJavaProxy!R(Env(), Env().Val().CallStaticObjectMethod(GetClass().Val(), Val()" ~
				ConcatStrings!(staticIndexedMap!(Fun, As)).Val ~
			")).Val();");
		}
	}

private:
	JavaClass _cls;
	jmethodID _val;
}
