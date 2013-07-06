module jni.JniProxy;

import std.typetuple;

import jni.jni;
import jni.JavaEnv;
import jni.JavaObject;
import jni.JavaClass;
import jni.JavaString;
import jni.JavaArray;


template _staticIndexedMap(alias F, size_t N, T...)
{
    static if (T.length == 0)
    {
        alias _staticIndexedMap = TypeTuple!();
    }
    else static if (T.length == 1)
    {
        alias _staticIndexedMap = TypeTuple!(F!(N, T[0]));
    }
    else
    {
        alias _staticIndexedMap =
            TypeTuple!(
                _staticIndexedMap!(F, N, T[0]),
                _staticIndexedMap!(F, N + 1, T[1 ..  $ ]));
    }
}

template staticIndexedMap(alias F, T...)
{
	alias staticIndexedMap = _staticIndexedMap!(F, 0, T);
}

unittest
{
	template Indexate(size_t i, T)
	{
		alias Fun = TypeTuple!(i, T);
	}

    // empty
    alias staticIndexedMap!(Indexate) Empty;
    static assert(Empty.length == 0);

    // single
    alias staticIndexedMap!(Indexate, int) Single;
    static assert(Single[0] == 0 && is(Single[1] == int));

    alias TL = staticIndexedMap!(Indexate, int, string);
    static assert(TL[0] == 0 && is(TL[3] == string));
}


//template _TypeMap(alias MAP, size_t N, TS...) {
//	static if (N < TS.length) {
//		alias _TypeMap = _TypeMap!(MAP, N + 1, TS[0..N], typeof(MAP(size_t.init, TS[N].init)), TS[N + 1..$]);
//	}
//	else {
//		alias _TypeMap = TS;
//	}
//}

//template TypeMap(alias MAP, TS...) {
//	alias TypeMap = _TypeMap!(MAP, 0, TS);
//}

//struct _ForEach(alias MAP, TS...) {
//	//pragma(msg, TS);
//	//pragma(msg, TypeMap!(MAP, TS));
//	TypeMap!(MAP, TS) tuple;

//	this(TS values) {
//		foreach (size_t i, ref v; values)
//			tuple[i] = MAP(i, v);
//	}
//}

//auto ForEach(alias MAP, TS...)(TS ts) {
//	return _ForEach!(MAP, TS)(ts);
//}


template IsPrimitiveJniType(T) {
	static if(is(T == jboolean) || 
		      is(T == jbyte) ||
		      is(T == jchar) ||
		      is(T == jshort) ||
		      is(T == jint) ||
		      is(T == jlong) ||
		      is(T == jfloat) ||
		      is(T == jdouble) ||
		      is(T == void))
		const Val = true;
	else
		const Val = false;
}

template JniArrayType(T) {
	alias jarray type;
}

template JniArrayType(T : jboolean) {
	alias jbooleanArray type;
}

template JniArrayType(T : jbyte) {
	alias jbyteArray type;
}

template JniArrayType(T : jchar) {
	alias jcharArray type;
}

template JniArrayType(T : jshort) {
	alias jshortArray type;
}

template JniArrayType(T : jint) {
	alias jintArray type;
}

template JniArrayType(T : jlong) {
	alias jlongArray type;
}

template JniArrayType(T : jfloat) {
	alias jfloatArray type;
}

template JniArrayType(T : jdouble) {
	alias jdoubleArray type;
}

template JniArrayType(T : jobject) {
	alias jobjectArray type;
}

template JniFuncTypeName(T) {
	static assert(false);
}
template JniFuncTypeName(T : void) {
	const Name = "Void";
}
template JniFuncTypeName(T : jboolean) {
	const Name = "Boolean";
}
template JniFuncTypeName(T : jbyte) {
	const Name = "Byte";
}
template JniFuncTypeName(T : jchar) {
	const Name = "Char";
}
template JniFuncTypeName(T : jshort) {
	const Name = "Short";
}
template JniFuncTypeName(T : jint) {
	const Name = "Int";
}
template JniFuncTypeName(T : jlong) {
	const Name = "Long";
}
template JniFuncTypeName(T : jfloat) {
	const Name = "Float";
}
template JniFuncTypeName(T : jdouble) {
	const Name = "Double";
}
template JniFuncTypeName(T : jobject) {
	const Name = "Object";
}


template JniSignatureBuilder(T) {
	static assert(false);
}
template JniSignatureBuilder() {
	const Sign = "";
}
template JniSignatureBuilder(T, Ts...) {
	const Sign = JniSignatureBuilder!T.Sign ~ JniSignatureBuilder!Ts.Sign;
}
template JniSignatureBuilder(T : void) {
	const Sign = "V";
}
template JniSignatureBuilder(T : jboolean) {
	const Sign = "Z";
}
template JniSignatureBuilder(T : jbyte) {
	const Sign = "B";
}
template JniSignatureBuilder(T : jchar) {
	const Sign = "C";
}
template JniSignatureBuilder(T : jshort) {
	const Sign = "S";
}
template JniSignatureBuilder(T : jint) {
	const Sign = "I";
}
template JniSignatureBuilder(T : jlong) {
	const Sign = "J";
}
template JniSignatureBuilder(T : jfloat) {
	const Sign = "F";
}
template JniSignatureBuilder(T : jdouble) {
	const Sign = "D";
}
template JniSignatureBuilder(T : JavaObject) {
	const Sign = "Ljava/lang/Object;";
}
template JniSignatureBuilder(T : JavaBoolean) {
	const Sign = "Ljava/lang/Boolean;";
}
template JniSignatureBuilder(T : JavaString) {
	const Sign = "Ljava/lang/String;";
}
template JniSignatureBuilder(T : JavaArray!U, U) {
	const Sign = "[" ~ JniSignatureBuilder!U.Sign;
}
template JniSignatureBuilder(T : string) {
	const Sign = JniSignatureBuilder!JavaString.Sign;
}
template JniSignatureBuilder(T : U[], U) {
	const Sign = JniSignatureBuilder!(JavaArray!U, U).Sign;
}
template JniSignatureBuilder(T : R function(As), R, As...) {
	const Sign = "(" ~ JniSignatureBuilder!As.Sign ~ ")" ~ JniSignatureBuilder!R.Sign;
}


template JniToJavaProxy(T) {
	struct JniToJavaProxy {
		this(JavaEnv, T v) {
			val = v;
		}
		T Val() const { return val; }
		T val;
	}
}

template JniToJavaProxy(T : JavaObject) {
	struct JniToJavaProxy {
		this(JavaEnv, ref T v) {
			val = v;
		}
		jobject Val() const { return val.Val(); }
		T val;
	}
}

template JniToJavaProxy(T : JavaBoolean) {
	struct JniToJavaProxy {
		this(JavaEnv, ref T v) {
			val = v;
		}
		jobject Val() const { return val.Val(); }
		T val;
	}
}

template JniToJavaProxy(T : JavaClass) {
	struct JniToJavaProxy {
		this(JavaEnv, ref T v) {
			val = v;
		}
		jobject Val() const { return val.Val(); }
		T val;
	}
}

template JniToJavaProxy(T : JavaString) {
	struct JniToJavaProxy {
		this(JavaEnv, ref T v) {
			val = v;
		}
		jobject Val() const { return val.Val(); }
		T val;
	}
}

template JniToJavaProxy(T : JavaArray!U, U) {
	struct JniToJavaProxy {
		this(JavaEnv, ref T v) {
			val = v;
		}
		jobject Val() const { return val.Val(); }
		T val;
	}
}

template JniToJavaProxy(T : string) {
	struct JniToJavaProxy {
		this(JavaEnv env, ref T v) {
			val.__ctor(env, v);
		}
		jobject Val() const { return val.Val(); }
		JavaString val;
	}
}

template JniToJavaProxy(T : U[], U) {
	struct JniToJavaProxy {
		this(JavaEnv env, ref T v) {
			val.__ctor(env, v);
		}
		jobject Val() const { return val.Val(); }
		JavaArray!U val;
	}
}

import std.typecons : tuple;

auto ToJavaProxy(T)(JavaEnv env, T v) {
	return JniToJavaProxy!T(env, v);
}

auto ToJavaProxy(Ts...)(JavaEnv env, Ts ts) if(ts.length > 1) {
	return tuple(ToJavaProxy!(Ts[0])(env, ts[0]).tupleof, ToJavaProxy!(Ts[1..$])(env, ts[1..$]).tupleof);
}

template JniFromJavaProxy(T : JavaObject) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = obj;
		}
		T Val() {
			return T(_env, _obj);
		}
		JavaEnv _env;
		jobject _obj;
	}
}

template JniFromJavaProxy(T : JavaBoolean) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = obj;
		}
		T Val() {
			return T(_env, _obj);
		}
		JavaEnv _env;
		jobject _obj;
	}
}

template JniFromJavaProxy(T : JavaClass) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = cast(jclass) obj;
		}
		T Val() {
			return T(_env, _obj);
		}
		JavaEnv _env;
		jclass _obj;
	}
}

template JniFromJavaProxy(T : JavaString) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = cast(jstring) obj;
		}
		T Val() {
			return T(_env, _obj);
		}
		JavaEnv _env;
		jstring _obj;
	}
}

template JniFromJavaProxy(T : JavaArray!U, U) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = cast(JniArrayType!U.type) obj;
		}
		T Val() {
			return T(_env, _obj);
		}
		JavaEnv _env;
		JniArrayType!U.type _obj;
	}
}

template JniFromJavaProxy(T : string) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = cast(jstring) obj;
		}
		T Val() {
			return JavaString(_env, _obj).Value();
		}
		JavaEnv _env;
		jstring _obj;
	}
}

template JniFromJavaProxy(T : U[], U) {
	struct JniFromJavaProxy {
		this(JavaEnv env, jobject obj) {
			_env = env;
			_obj = cast(JniArrayType!U.type) obj;
		}
		T Val() {
			return JniFromJavaProxy!(JavaArray!U, U)(_env, _obj).Val().ToVector();
		}
		JavaEnv _env;
		JniArrayType!U.type _obj;
	}
}

auto FromJavaProxy(T, J)(JavaEnv env, J v) {
	return JniFromJavaProxy!(T)(env, v);
}
