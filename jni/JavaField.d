module jni.JavaField;

import std.algorithm;
import std.typetuple;

import jni.jni;
import jni.JniProxy;
import jni.JavaEnv;
import jni.JavaObject;
import jni.JavaClass;


struct JavaField(T) {
public:
	static JavaField opCall() {
		return JavaField(JavaObject(), null);
	}

	this(JavaObject obj, jfieldID mid) {
		_obj = obj;
		_val = mid;
	}

	this(JavaField m) {
		swap(_obj, m._obj);
		swap(_val, m._val);
		m._obj = JavaObject();
		m._val = null;
	}

	this(ref JavaField m) {
		_obj.__ctor(m._obj);
		_val = m._val;
	}

	ref JavaField opAssign(JavaField m) {
		swap(_obj, m._obj);
		swap(_val, m._val);
		return this;
	}

	ref JavaField opAssign(ref JavaField m) {
		_obj = m._obj;
		_val = m._val;
		return this;
	}

	bool opEquals(ref const(JavaField) m) const {
		return _obj == m._obj && _val == m._val;
	}

	jfieldID Val() const {
		return cast(jfieldID) _val;
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

	static if(IsPrimitiveJniType!T.Val) {
		T Get() const {
			mixin("return Env().Val().Get" ~ JniFuncTypeName!T.Name ~ "Field(GetObject().Val(), Val());");
		}
		void Set(T val) {
			mixin("Env().Val().Set" ~ JniFuncTypeName!T.Name ~ "Field(GetObject().Val(), Val(), val);");
		}
	}
	else {
		T Get() const {
			return FromJavaProxy!T(Env(), Env().Val().GetObjectField(GetObject().Val(), Val())).Val();
		}
		void Set(T val) {
			Env().Val().SetObjectField(GetObject().Val(), Val(), ToJavaProxy!T(Env(), val).Val());
		}
	}

private:
	JavaObject _obj;
	jfieldID _val;
}

struct JavaStaticField(T) {
public:
	static JavaStaticField opCall() {
		return JavaStaticField(JavaClass(), null);
	}

	this(JavaClass cls, jfieldID mid) {
		_cls = cls;
		_val = mid;
	}

	this(JavaStaticField m) {
		swap(_cls, m._cls);
		swap(_val, m._val);
		m._cls = JavaClass();
		m._val = null;
	}

	this(ref JavaStaticField m) {
		_cls.__ctor(m._cls);
		_val = m._val;
	}

	ref JavaStaticField opAssign(JavaStaticField m) {
		swap(_cls, m._cls);
		swap(_val, m._val);
		return this;
	}

	ref JavaStaticField opAssign(ref JavaStaticField m) {
		_cls = m._cls;
		_val = m._val;
		return this;
	}

	bool opEquals(ref const(JavaStaticField) m) const {
		return _cls == m._cls && _val == m._val;
	}

	jfieldID Val() const {
		return cast(jfieldID) _val;
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

	static if(IsPrimitiveJniType!T.Val) {
		T Get() const {
			mixin("return Env().Val().GetStatic" ~ JniFuncTypeName!T.Name ~ "Field(GetClass().Val(), Val());");
		}
		void Set(T val) {
			mixin("Env().Val().SetStatic" ~ JniFuncTypeName!T.Name ~ "Field(GetClass().Val(), Val(), val);");
		}
	}
	else {
		T Get() const {
			return FromJavaProxy!T(Env(), Env().Val().GetStaticObjectField(GetClass().Val(), Val())).Val();
		}
		void Set(T val) {
			Env().Val().SetStaticObjectField(GetClass().Val(), Val(), ToJavaProxy!T(Env(), val).Val());
		}
	}

private:
	JavaClass _cls;
	jfieldID _val;
}
