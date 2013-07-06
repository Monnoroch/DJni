module jni.JavaArray;

import std.stdio;
import std.algorithm;

import jni.jni;
import jni.JniProxy;
import jni.JavaEnv;
import jni.JavaObject;
import jni.JavaString;


struct JavaArray(Elem) {
	mixin template Classspec(T) {
		static if(IsPrimitiveJniType!T.Val) {
			private void GetData(jsize from, jsize len, T * ptr) const {
				mixin("Env().Val().Get" ~ JniFuncTypeName!T.Name ~ "ArrayRegion(Val(), from, len, ptr);");
			}

			private void SetData(jsize from, jsize len, const(T) * ptr) {
				mixin("Env().Val().Set" ~ JniFuncTypeName!T.Name ~ "ArrayRegion(Val(), from, len, ptr);");
			}

			public T Get(jsize n) const {
				T res;
				GetData(n, 1, &res);
				return res;
			}

			public void Set(jsize n, T val) {
				SetData(n, 1, &val);
			}

			public T[] ToVector() const {
				auto len = Length();
				if(len == 0)
					return [];
				T[] res = std.array.uninitializedArray!(T[])(len);
				GetData(0, len, &res[0]);
				return res;
			}	

			private void FromVector(T[] vec) {
				SetData(0, cast(jsize) vec.length, &vec[0]);
			}

			alias JniArrayType!T.type Arr;
		}
		else {
			public T Get(jsize n) const {
				return FromJavaProxy!T(Env(), Env().Val().GetObjectArrayElement(Val(), n)).Val();
			}

			public void Set(jsize n, T val) {
				Env().Val().SetObjectArrayElement(Val(), n, ToJavaProxy!T(Env(), val).Val());
			}

			//public this(JavaEnv env, jsize size) {
			//	writefln("%s(JavaEnv, jsize)", __FUNCTION__);
			//	this(env, mixin("env.Val().New" ~ JniFuncTypeName!jobject.Name ~ "Array(size)"));
			//}

			public T[] ToVector() const {
				auto len = Length();
				if(len == 0)
					return [];
				T[] res = std.array.uninitializedArray!(T[])(len);
				for(auto i = 0; i < len; ++i)
					res[i] = Get(i);
				return res;
			}

			private void FromVector(T[] vec) {
				auto len = vec.length;
				for(auto i = 0; i < len; ++i)
					Set(i, vec[i]);
			}

			alias JniArrayType!jobject.type Arr;
		}
	}

	mixin Classspec!Elem;

public:
	static JavaArray!Elem opCall() {
		return JavaArray(JavaEnv(), cast(Arr) null);
	}

	this(JavaEnv env, Arr arr) {
		writefln("%s(JavaEnv, Arr)", __FUNCTION__);
		base.__ctor(env, arr);
	}

	this(JavaEnv env, Elem[] vec) {
		writefln("%s(JavaEnv, Elem[])", __FUNCTION__);
		this(env, cast(jsize) vec.length);
		FromVector(vec);
	}

	static if(IsPrimitiveJniType!Elem.Val) {
		this(JavaEnv env, jsize size) {
			writefln("%s(JavaEnv, jsize)", __FUNCTION__);
			mixin("this(env, env.Val().New" ~ JniFuncTypeName!Elem.Name ~ "Array(size));");
		}
	}
	else {
		this(JavaEnv env, jsize size) {
			writefln("%s(JavaEnv, jsize)", __FUNCTION__);
			this(env, env.Val().NewObjectArray(size, env.FindClass(JniSignatureBuilder!Elem.Sign).Val(), null));
		}
	}

	this(JavaArray arr) {
		writefln("%s(JavaArray)", __FUNCTION__);
		swap(base, arr.base);
		arr.base = JavaObject();
	}

	this(ref JavaArray arr) {
		writefln("%s(ref JavaArray)", __FUNCTION__);
		base.__ctor(arr.base);
	}

	this(this) {
		writefln("%s", __FUNCTION__);
	}

	~this() {
		writefln("%s", __FUNCTION__);	
	}

	// swap with rvalue
	ref JavaArray opAssign(JavaArray v) {
		writefln("%s(JavaArray)", __FUNCTION__);
		swap(base, v.base);
		return this;
	}

	// destroy and copy from lvalue
	ref JavaArray opAssign(ref JavaArray v) {
		writefln("%s(ref JavaArray)", __FUNCTION__);
		base.opAssign(v.base);
		return this;
	}

	bool opEquals(ref const(JavaArray) arr) const {
		writefln("%s(ref JavaString)", __FUNCTION__);
		if(base == arr.base)
			return true;

		auto l1 = Length(), l2 = arr.Length();
		if(l1 != l2)
			return false;
		
		return ToVector() == arr.ToVector();
	}

	bool opEquals(Elem[] arr) const {
		if(Length() != arr.length)
			return false;
		return ToVector() == arr;
	}

	Elem opIndex(uint n) const {
		return Get(n);
	}

	jsize Length() const {
		return Env().Val().GetArrayLength(Val());
	}

	Arr Val() const { return cast(Arr) _obj; }

	JavaObject base;
	alias base this;
}
