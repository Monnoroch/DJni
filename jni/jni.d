module jni.jni;

import core.vararg;


extern (C) {

alias int jint;
alias long jlong;
alias byte jbyte;
alias ubyte jboolean;
alias ushort jchar;
alias short jshort;
alias float jfloat;
alias double jdouble;
alias jint jsize;

class _jobject {}
alias _jobject jobject;
alias _jobject jclass;
alias _jobject jthrowable;
alias _jobject jstring;
alias _jobject jarray;
alias _jobject jbooleanArray;
alias _jobject jbyteArray;
alias _jobject jcharArray;
alias _jobject jshortArray;
alias _jobject jintArray;
alias _jobject jlongArray;
alias _jobject jfloatArray;
alias _jobject jdoubleArray;
alias _jobject jobjectArray;

alias jobject jweak;
	

union jvalue {
	jboolean z;
	jbyte b;
	jchar c;
	jshort s;
	jint i;
	jlong j;
	jfloat f;
	jdouble d;
	jobject l;
}


class _jfieldID {}
alias _jfieldID jfieldID;

struct _jmethodID {}
alias _jmethodID* jmethodID;


enum _jobjectType {
	JNIInvalidRefType,
	JNILocalRefType,
	JNIGlobalRefType,
	JNIWeakGlobalRefType,
}

alias _jobjectType jobjectRefType;


const JNI_FALSE = 0;
const JNI_TRUE = 1;


const JNI_OK        = ( 0);			  /* success */
const JNI_ERR       = (-1);			  /* unknown error */
const JNI_EDETACHED = (-2);			  /* thread detached from the VM */
const JNI_EVERSION  = (-3);			  /* JNI version error */
const JNI_ENOMEM    = (-4);			  /* not enough memory */
const JNI_EEXIST    = (-5);			  /* VM already created */
const JNI_EINVAL    = (-6);			  /* invalid arguments */


const JNI_COMMIT = 1;
const JNI_ABORT  = 2;


struct JNINativeMethod {
	char *name;
	char *signature;
	void *fnPtr;
}


struct JNINativeInterface_ {
	void *reserved0;
	void *reserved1;
	void *reserved2;
	void *reserved3;
	jint  function(const(JNIEnv_) *env)GetVersion;
	jclass  function(const(JNIEnv_) *env, const(char) *name, jobject loader, const(jbyte) *buf, jsize len)DefineClass;
	jclass  function(const(JNIEnv_) *env, const(char) *name)FindClass;
	jmethodID  function(const(JNIEnv_) *env, jobject method)FromReflectedMethod;
	jfieldID  function(const(JNIEnv_) *env, jobject field)FromReflectedField;
	jobject  function(const(JNIEnv_) *env, jclass cls, jmethodID methodID, jboolean isStatic)ToReflectedMethod;
	jclass  function(const(JNIEnv_) *env, jclass sub)GetSuperclass;
	jboolean  function(const(JNIEnv_) *env, jclass sub, jclass sup)IsAssignableFrom;
	jobject  function(const(JNIEnv_) *env, jclass cls, jfieldID fieldID, jboolean isStatic)ToReflectedField;
	jint  function(const(JNIEnv_) *env, jthrowable obj)Throw;
	jint  function(const(JNIEnv_) *env, jclass clazz, const(char) *msg)ThrowNew;
	jthrowable  function(const(JNIEnv_) *env)ExceptionOccurred;
	void  function(const(JNIEnv_) *env)ExceptionDescribe;
	void  function(const(JNIEnv_) *env)ExceptionClear;
	void  function(const(JNIEnv_) *env, const(char) *msg)FatalError;
	jint  function(const(JNIEnv_) *env, jint capacity)PushLocalFrame;
	jobject  function(const(JNIEnv_) *env, jobject result)PopLocalFrame;
	jobject  function(const(JNIEnv_) *env, jobject lobj)NewGlobalRef;
	void  function(const(JNIEnv_) *env, jobject gref)DeleteGlobalRef;
	void  function(const(JNIEnv_) *env, jobject obj)DeleteLocalRef;
	jboolean  function(const(JNIEnv_) *env, jobject obj1, jobject obj2)IsSameObject;
	jobject  function(const(JNIEnv_) *env, jobject _ref)NewLocalRef;
	jint  function(const(JNIEnv_) *env, jint capacity)EnsureLocalCapacity;
	jobject  function(const(JNIEnv_) *env, jclass clazz)AllocObject;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)NewObject;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)NewObjectV;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)NewObjectA;
	jclass  function(const(JNIEnv_) *env, jobject obj)GetObjectClass;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jclass clazz)IsInstanceOf;
	jmethodID  function(const(JNIEnv_) *env, jclass clazz, const(char) *name, const(char) *sig)GetMethodID;
	jobject  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallObjectMethod;
	jobject  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallObjectMethodV;
	jobject  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallObjectMethodA;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallBooleanMethod;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallBooleanMethodV;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallBooleanMethodA;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallByteMethod;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallByteMethodV;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallByteMethodA;
	jchar  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallCharMethod;
	jchar  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallCharMethodV;
	jchar  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallCharMethodA;
	jshort  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallShortMethod;
	jshort  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallShortMethodV;
	jshort  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallShortMethodA;
	jint  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallIntMethod;
	jint  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallIntMethodV;
	jint  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallIntMethodA;
	jlong  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallLongMethod;
	jlong  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallLongMethodV;
	jlong  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallLongMethodA;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallFloatMethod;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallFloatMethodV;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallFloatMethodA;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallDoubleMethod;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallDoubleMethodV;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallDoubleMethodA;
	void  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID,...)CallVoidMethod;
	void  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, va_list args)CallVoidMethodV;
	void  function(const(JNIEnv_) *env, jobject obj, jmethodID methodID, const(jvalue) *args)CallVoidMethodA;
	jobject  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualObjectMethod;
	jobject  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualObjectMethodV;
	jobject  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualObjectMethodA;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualBooleanMethod;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualBooleanMethodV;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualBooleanMethodA;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualByteMethod;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualByteMethodV;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualByteMethodA;
	jchar  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualCharMethod;
	jchar  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualCharMethodV;
	jchar  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualCharMethodA;
	jshort  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualShortMethod;
	jshort  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualShortMethodV;
	jshort  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualShortMethodA;
	jint  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualIntMethod;
	jint  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualIntMethodV;
	jint  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualIntMethodA;
	jlong  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualLongMethod;
	jlong  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualLongMethodV;
	jlong  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualLongMethodA;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualFloatMethod;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualFloatMethodV;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualFloatMethodA;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualDoubleMethod;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualDoubleMethodV;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualDoubleMethodA;
	void  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID,...)CallNonvirtualVoidMethod;
	void  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, va_list args)CallNonvirtualVoidMethodV;
	void  function(const(JNIEnv_) *env, jobject obj, jclass clazz, jmethodID methodID, const(jvalue) *args)CallNonvirtualVoidMethodA;
	jfieldID  function(const(JNIEnv_) *env, jclass clazz, const(char) *name, const(char) *sig)GetFieldID;
	jobject  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetObjectField;
	jboolean  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetBooleanField;
	jbyte  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetByteField;
	jchar  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetCharField;
	jshort  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetShortField;
	jint  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetIntField;
	jlong  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetLongField;
	jfloat  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetFloatField;
	jdouble  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID)GetDoubleField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jobject val)SetObjectField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jboolean val)SetBooleanField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jbyte val)SetByteField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jchar val)SetCharField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jshort val)SetShortField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jint val)SetIntField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jlong val)SetLongField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jfloat val)SetFloatField;
	void  function(const(JNIEnv_) *env, jobject obj, jfieldID fieldID, jdouble val)SetDoubleField;
	jmethodID  function(const(JNIEnv_) *env, jclass clazz, const(char) *name, const(char) *sig)GetStaticMethodID;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticObjectMethod;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticObjectMethodV;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticObjectMethodA;
	jboolean  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticBooleanMethod;
	jboolean  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticBooleanMethodV;
	jboolean  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticBooleanMethodA;
	jbyte  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticByteMethod;
	jbyte  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticByteMethodV;
	jbyte  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticByteMethodA;
	jchar  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticCharMethod;
	jchar  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticCharMethodV;
	jchar  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticCharMethodA;
	jshort  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticShortMethod;
	jshort  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticShortMethodV;
	jshort  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticShortMethodA;
	jint  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticIntMethod;
	jint  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticIntMethodV;
	jint  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticIntMethodA;
	jlong  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticLongMethod;
	jlong  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticLongMethodV;
	jlong  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticLongMethodA;
	jfloat  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticFloatMethod;
	jfloat  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticFloatMethodV;
	jfloat  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticFloatMethodA;
	jdouble  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID,...)CallStaticDoubleMethod;
	jdouble  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, va_list args)CallStaticDoubleMethodV;
	jdouble  function(const(JNIEnv_) *env, jclass clazz, jmethodID methodID, const(jvalue) *args)CallStaticDoubleMethodA;
	void  function(const(JNIEnv_) *env, jclass cls, jmethodID methodID,...)CallStaticVoidMethod;
	void  function(const(JNIEnv_) *env, jclass cls, jmethodID methodID, va_list args)CallStaticVoidMethodV;
	void  function(const(JNIEnv_) *env, jclass cls, jmethodID methodID, const(jvalue) *args)CallStaticVoidMethodA;
	jfieldID  function(const(JNIEnv_) *env, jclass clazz, const(char) *name, const(char) *sig)GetStaticFieldID;
	jobject  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticObjectField;
	jboolean  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticBooleanField;
	jbyte  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticByteField;
	jchar  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticCharField;
	jshort  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticShortField;
	jint  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticIntField;
	jlong  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticLongField;
	jfloat  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticFloatField;
	jdouble  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID)GetStaticDoubleField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jobject value)SetStaticObjectField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jboolean value)SetStaticBooleanField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jbyte value)SetStaticByteField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jchar value)SetStaticCharField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jshort value)SetStaticShortField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jint value)SetStaticIntField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jlong value)SetStaticLongField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jfloat value)SetStaticFloatField;
	void  function(const(JNIEnv_) *env, jclass clazz, jfieldID fieldID, jdouble value)SetStaticDoubleField;
	jstring  function(const(JNIEnv_) *env, const(jchar) *unicode, jsize len)NewString;
	jsize  function(const(JNIEnv_) *env, jstring str)GetStringLength;
	jchar * function(const(JNIEnv_) *env, jstring str, jboolean *isCopy)GetStringChars;
	void  function(const(JNIEnv_) *env, jstring str, const(jchar) *chars)ReleaseStringChars;
	jstring  function(const(JNIEnv_) *env, const(char) *utf)NewStringUTF;
	jsize  function(const(JNIEnv_) *env, jstring str)GetStringUTFLength;
	const(char) * function(const(JNIEnv_) *env, jstring str, jboolean *isCopy)GetStringUTFChars;
	void  function(const(JNIEnv_) *env, jstring str, const(char) *chars)ReleaseStringUTFChars;
	jsize  function(const(JNIEnv_) *env, jarray array)GetArrayLength;
	jobjectArray  function(const(JNIEnv_) *env, jsize len, jclass clazz, jobject init)NewObjectArray;
	jobject  function(const(JNIEnv_) *env, jobjectArray array, jsize index)GetObjectArrayElement;
	void  function(const(JNIEnv_) *env, jobjectArray array, jsize index, jobject val)SetObjectArrayElement;
	jbooleanArray  function(const(JNIEnv_) *env, jsize len)NewBooleanArray;
	jbyteArray  function(const(JNIEnv_) *env, jsize len)NewByteArray;
	jcharArray  function(const(JNIEnv_) *env, jsize len)NewCharArray;
	jshortArray  function(const(JNIEnv_) *env, jsize len)NewShortArray;
	jintArray  function(const(JNIEnv_) *env, jsize len)NewIntArray;
	jlongArray  function(const(JNIEnv_) *env, jsize len)NewLongArray;
	jfloatArray  function(const(JNIEnv_) *env, jsize len)NewFloatArray;
	jdoubleArray  function(const(JNIEnv_) *env, jsize len)NewDoubleArray;
	jboolean * function(const(JNIEnv_) *env, jbooleanArray array, jboolean *isCopy)GetBooleanArrayElements;
	jbyte * function(const(JNIEnv_) *env, jbyteArray array, jboolean *isCopy)GetByteArrayElements;
	jchar * function(const(JNIEnv_) *env, jcharArray array, jboolean *isCopy)GetCharArrayElements;
	jshort * function(const(JNIEnv_) *env, jshortArray array, jboolean *isCopy)GetShortArrayElements;
	jint * function(const(JNIEnv_) *env, jintArray array, jboolean *isCopy)GetIntArrayElements;
	jlong * function(const(JNIEnv_) *env, jlongArray array, jboolean *isCopy)GetLongArrayElements;
	jfloat * function(const(JNIEnv_) *env, jfloatArray array, jboolean *isCopy)GetFloatArrayElements;
	jdouble * function(const(JNIEnv_) *env, jdoubleArray array, jboolean *isCopy)GetDoubleArrayElements;
	void  function(const(JNIEnv_) *env, jbooleanArray array, jboolean *elems, jint mode)ReleaseBooleanArrayElements;
	void  function(const(JNIEnv_) *env, jbyteArray array, jbyte *elems, jint mode)ReleaseByteArrayElements;
	void  function(const(JNIEnv_) *env, jcharArray array, jchar *elems, jint mode)ReleaseCharArrayElements;
	void  function(const(JNIEnv_) *env, jshortArray array, jshort *elems, jint mode)ReleaseShortArrayElements;
	void  function(const(JNIEnv_) *env, jintArray array, jint *elems, jint mode)ReleaseIntArrayElements;
	void  function(const(JNIEnv_) *env, jlongArray array, jlong *elems, jint mode)ReleaseLongArrayElements;
	void  function(const(JNIEnv_) *env, jfloatArray array, jfloat *elems, jint mode)ReleaseFloatArrayElements;
	void  function(const(JNIEnv_) *env, jdoubleArray array, jdouble *elems, jint mode)ReleaseDoubleArrayElements;
	void  function(const(JNIEnv_) *env, jbooleanArray array, jsize start, jsize l, jboolean *buf)GetBooleanArrayRegion;
	void  function(const(JNIEnv_) *env, jbyteArray array, jsize start, jsize len, jbyte *buf)GetByteArrayRegion;
	void  function(const(JNIEnv_) *env, jcharArray array, jsize start, jsize len, jchar *buf)GetCharArrayRegion;
	void  function(const(JNIEnv_) *env, jshortArray array, jsize start, jsize len, jshort *buf)GetShortArrayRegion;
	void  function(const(JNIEnv_) *env, jintArray array, jsize start, jsize len, jint *buf)GetIntArrayRegion;
	void  function(const(JNIEnv_) *env, jlongArray array, jsize start, jsize len, jlong *buf)GetLongArrayRegion;
	void  function(const(JNIEnv_) *env, jfloatArray array, jsize start, jsize len, jfloat *buf)GetFloatArrayRegion;
	void  function(const(JNIEnv_) *env, jdoubleArray array, jsize start, jsize len, jdouble *buf)GetDoubleArrayRegion;
	void  function(const(JNIEnv_) *env, jbooleanArray array, jsize start, jsize l, const(jboolean) *buf)SetBooleanArrayRegion;
	void  function(const(JNIEnv_) *env, jbyteArray array, jsize start, jsize len, const(jbyte) *buf)SetByteArrayRegion;
	void  function(const(JNIEnv_) *env, jcharArray array, jsize start, jsize len, const(jchar) *buf)SetCharArrayRegion;
	void  function(const(JNIEnv_) *env, jshortArray array, jsize start, jsize len, const(jshort) *buf)SetShortArrayRegion;
	void  function(const(JNIEnv_) *env, jintArray array, jsize start, jsize len, const(jint) *buf)SetIntArrayRegion;
	void  function(const(JNIEnv_) *env, jlongArray array, jsize start, jsize len, const(jlong) *buf)SetLongArrayRegion;
	void  function(const(JNIEnv_) *env, jfloatArray array, jsize start, jsize len, const(jfloat) *buf)SetFloatArrayRegion;
	void  function(const(JNIEnv_) *env, jdoubleArray array, jsize start, jsize len, const(jdouble) *buf)SetDoubleArrayRegion;
	jint  function(const(JNIEnv_) *env, jclass clazz, const(JNINativeMethod) *methods, jint nMethods)RegisterNatives;
	jint  function(const(JNIEnv_) *env, jclass clazz)UnregisterNatives;
	jint  function(const(JNIEnv_) *env, jobject obj)MonitorEnter;
	jint  function(const(JNIEnv_) *env, jobject obj)MonitorExit;
	jint  function(const(JNIEnv_) *env, JavaVM_ **vm)GetJavaVM;
	void  function(const(JNIEnv_) *env, jstring str, jsize start, jsize len, jchar *buf)GetStringRegion;
	void  function(const(JNIEnv_) *env, jstring str, jsize start, jsize len, const(char) *buf)GetStringUTFRegion;
	void * function(const(JNIEnv_) *env, jarray array, jboolean *isCopy)GetPrimitiveArrayCritical;
	void  function(const(JNIEnv_) *env, jarray array, void *carray, jint mode)ReleasePrimitiveArrayCritical;
	jchar * function(const(JNIEnv_) *env, jstring string, jboolean *isCopy)GetStringCritical;
	void  function(const(JNIEnv_) *env, jstring string, const(jchar) *cstring)ReleaseStringCritical;
	jweak  function(const(JNIEnv_) *env, jobject obj)NewWeakGlobalRef;
	void  function(const(JNIEnv_) *env, jweak _ref)DeleteWeakGlobalRef;
	jboolean  function(const(JNIEnv_) *env)ExceptionCheck;
	jobject  function(const(JNIEnv_) *env, void *address, jlong capacity)NewDirectByteBuffer;
	void * function(const(JNIEnv_) *env, jobject buf)GetDirectBufferAddress;
	jlong  function(const(JNIEnv_) *env, jobject buf)GetDirectBufferCapacity;
	jobjectRefType  function(const(JNIEnv_) *env, jobject obj)GetObjectRefType;
}

struct JNIEnv_ {
	const JNINativeInterface_ *functions;

	jint GetVersion() const {
		return functions.GetVersion(&this);
	}
	jclass DefineClass(const(char) *name, jobject loader, const(jbyte) *buf,
					   jsize len) const {
		return functions.DefineClass(&this, name, loader, buf, len);
	}
	jclass FindClass(const(char) *name) const {
		return functions.FindClass(&this, name);
	}
	jmethodID FromReflectedMethod(jobject method) const {
		return functions.FromReflectedMethod(&this,method);
	}
	jfieldID FromReflectedField(jobject field) const {
		return functions.FromReflectedField(&this,field);
	}

	jobject ToReflectedMethod(jclass cls, jmethodID methodID, jboolean isStatic) const {
		return functions.ToReflectedMethod(&this, cls, methodID, isStatic);
	}

	jclass GetSuperclass(jclass sub) const {
		return functions.GetSuperclass(&this, sub);
	}
	jboolean IsAssignableFrom(jclass sub, jclass sup) const {
		return functions.IsAssignableFrom(&this, sub, sup);
	}

	jobject ToReflectedField(jclass cls, jfieldID fieldID, jboolean isStatic) const {
		return functions.ToReflectedField(&this,cls,fieldID,isStatic);
	}

	jint Throw(jthrowable obj) const {
		return functions.Throw(&this, obj);
	}
	jint ThrowNew(jclass clazz, const(char) *msg) const {
		return functions.ThrowNew(&this, clazz, msg);
	}
	jthrowable ExceptionOccurred() const {
		return functions.ExceptionOccurred(&this);
	}
	void ExceptionDescribe() const {
		functions.ExceptionDescribe(&this);
	}
	void ExceptionClear() const {
		functions.ExceptionClear(&this);
	}
	void FatalError(const(char) *msg) const {
		functions.FatalError(&this, msg);
	}

	jint PushLocalFrame(jint capacity) const {
		return functions.PushLocalFrame(&this,capacity);
	}
	jobject PopLocalFrame(jobject result) const {
		return functions.PopLocalFrame(&this,result);
	}

	jobject NewGlobalRef(jobject lobj) const {
		return functions.NewGlobalRef(&this,lobj);
	}
	void DeleteGlobalRef(jobject gref) const {
		functions.DeleteGlobalRef(&this,gref);
	}
	void DeleteLocalRef(jobject obj) const {
		functions.DeleteLocalRef(&this, obj);
	}

	jboolean IsSameObject(jobject obj1, jobject obj2) const {
		return functions.IsSameObject(&this,obj1,obj2);
	}

	jobject NewLocalRef(jobject _ref) const {
		return functions.NewLocalRef(&this,_ref);
	}
	jint EnsureLocalCapacity(jint capacity) const {
		return functions.EnsureLocalCapacity(&this,capacity);
	}

	jobject AllocObject(jclass clazz) const {
		return functions.AllocObject(&this,clazz);
	}
	jobject NewObject(jclass clazz, jmethodID methodID, ...) const {
		va_list args;
		jobject result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.NewObjectV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jobject NewObjectV(jclass clazz, jmethodID methodID,
					   va_list args) const {
		return functions.NewObjectV(&this,clazz,methodID,args);
	}
	jobject NewObjectA(jclass clazz, jmethodID methodID,
					   const(jvalue) *args) const {
		return functions.NewObjectA(&this,clazz,methodID,args);
	}

	jclass GetObjectClass(jobject obj) const {
		return functions.GetObjectClass(&this,obj);
	}
	jboolean IsInstanceOf(jobject obj, jclass clazz) const {
		return functions.IsInstanceOf(&this,obj,clazz);
	}

	jmethodID GetMethodID(jclass clazz, const(char) *name,
						  const(char) *sig) const {
		return functions.GetMethodID(&this,clazz,name,sig);
	}

	jobject CallObjectMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jobject result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallObjectMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jobject CallObjectMethodV(jobject obj, jmethodID methodID,
						va_list args) const {
		return functions.CallObjectMethodV(&this,obj,methodID,args);
	}
	jobject CallObjectMethodA(jobject obj, jmethodID methodID,
						const(jvalue) * args) const {
		return functions.CallObjectMethodA(&this,obj,methodID,args);
	}

	jboolean CallBooleanMethod(jobject obj,
							   jmethodID methodID, ...) const {
		va_list args;
		jboolean result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallBooleanMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jboolean CallBooleanMethodV(jobject obj, jmethodID methodID,
								va_list args) const {
		return functions.CallBooleanMethodV(&this,obj,methodID,args);
	}
	jboolean CallBooleanMethodA(jobject obj, jmethodID methodID,
								const(jvalue) * args) const {
		return functions.CallBooleanMethodA(&this,obj,methodID, args);
	}

	jbyte CallByteMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jbyte result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallByteMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jbyte CallByteMethodV(jobject obj, jmethodID methodID,
						  va_list args) const {
		return functions.CallByteMethodV(&this,obj,methodID,args);
	}
	jbyte CallByteMethodA(jobject obj, jmethodID methodID,
						  const(jvalue) * args) const {
		return functions.CallByteMethodA(&this,obj,methodID,args);
	}

	jchar CallCharMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jchar result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallCharMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jchar CallCharMethodV(jobject obj, jmethodID methodID,
						  va_list args) const {
		return functions.CallCharMethodV(&this,obj,methodID,args);
	}
	jchar CallCharMethodA(jobject obj, jmethodID methodID,
						  const(jvalue) * args) const {
		return functions.CallCharMethodA(&this,obj,methodID,args);
	}

	jshort CallShortMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jshort result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallShortMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jshort CallShortMethodV(jobject obj, jmethodID methodID,
							va_list args) const {
		return functions.CallShortMethodV(&this,obj,methodID,args);
	}
	jshort CallShortMethodA(jobject obj, jmethodID methodID,
							const(jvalue) * args) const {
		return functions.CallShortMethodA(&this,obj,methodID,args);
	}

	jint CallIntMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jint result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallIntMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jint CallIntMethodV(jobject obj, jmethodID methodID,
						va_list args) const {
		return functions.CallIntMethodV(&this,obj,methodID,args);
	}
	jint CallIntMethodA(jobject obj, jmethodID methodID,
						const(jvalue) * args) const {
		return functions.CallIntMethodA(&this,obj,methodID,args);
	}

	jlong CallLongMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jlong result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallLongMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jlong CallLongMethodV(jobject obj, jmethodID methodID,
						  va_list args) const {
		return functions.CallLongMethodV(&this,obj,methodID,args);
	}
	jlong CallLongMethodA(jobject obj, jmethodID methodID,
						  const(jvalue) * args) const {
		return functions.CallLongMethodA(&this,obj,methodID,args);
	}

	jfloat CallFloatMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jfloat result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallFloatMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jfloat CallFloatMethodV(jobject obj, jmethodID methodID,
							va_list args) const {
		return functions.CallFloatMethodV(&this,obj,methodID,args);
	}
	jfloat CallFloatMethodA(jobject obj, jmethodID methodID,
							const(jvalue) * args) const {
		return functions.CallFloatMethodA(&this,obj,methodID,args);
	}

	jdouble CallDoubleMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		jdouble result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallDoubleMethodV(&this,obj,methodID,args);
		va_end(args);
		return result;
	}
	jdouble CallDoubleMethodV(jobject obj, jmethodID methodID,
						va_list args) const {
		return functions.CallDoubleMethodV(&this,obj,methodID,args);
	}
	jdouble CallDoubleMethodA(jobject obj, jmethodID methodID,
						const(jvalue) * args) const {
		return functions.CallDoubleMethodA(&this,obj,methodID,args);
	}

	void CallVoidMethod(jobject obj, jmethodID methodID, ...) const {
		va_list args;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		functions.CallVoidMethodV(&this,obj,methodID,args);
		va_end(args);
	}
	void CallVoidMethodV(jobject obj, jmethodID methodID,
						 va_list args) const {
		functions.CallVoidMethodV(&this,obj,methodID,args);
	}
	void CallVoidMethodA(jobject obj, jmethodID methodID,
						 const(jvalue) * args) const {
		functions.CallVoidMethodA(&this,obj,methodID,args);
	}

	jobject CallNonvirtualObjectMethod(jobject obj, jclass clazz,
									   jmethodID methodID, ...) const {
		va_list args;
		jobject result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualObjectMethodV(&this,obj,clazz,
														methodID,args);
		va_end(args);
		return result;
	}
	jobject CallNonvirtualObjectMethodV(jobject obj, jclass clazz,
										jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualObjectMethodV(&this,obj,clazz,
													  methodID,args);
	}
	jobject CallNonvirtualObjectMethodA(jobject obj, jclass clazz,
										jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualObjectMethodA(&this,obj,clazz,
													  methodID,args);
	}

	jboolean CallNonvirtualBooleanMethod(jobject obj, jclass clazz,
										 jmethodID methodID, ...) const {
		va_list args;
		jboolean result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualBooleanMethodV(&this,obj,clazz,
														 methodID,args);
		va_end(args);
		return result;
	}
	jboolean CallNonvirtualBooleanMethodV(jobject obj, jclass clazz,
										  jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualBooleanMethodV(&this,obj,clazz,
													   methodID,args);
	}
	jboolean CallNonvirtualBooleanMethodA(jobject obj, jclass clazz,
										  jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualBooleanMethodA(&this,obj,clazz,
													   methodID, args);
	}

	jbyte CallNonvirtualByteMethod(jobject obj, jclass clazz,
								   jmethodID methodID, ...) const {
		va_list args;
		jbyte result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualByteMethodV(&this,obj,clazz,
													  methodID,args);
		va_end(args);
		return result;
	}
	jbyte CallNonvirtualByteMethodV(jobject obj, jclass clazz,
									jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualByteMethodV(&this,obj,clazz,
													methodID,args);
	}
	jbyte CallNonvirtualByteMethodA(jobject obj, jclass clazz,
									jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualByteMethodA(&this,obj,clazz,
													methodID,args);
	}

	jchar CallNonvirtualCharMethod(jobject obj, jclass clazz,
								   jmethodID methodID, ...) const {
		va_list args;
		jchar result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualCharMethodV(&this,obj,clazz,
													  methodID,args);
		va_end(args);
		return result;
	}
	jchar CallNonvirtualCharMethodV(jobject obj, jclass clazz,
									jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualCharMethodV(&this,obj,clazz,
													methodID,args);
	}
	jchar CallNonvirtualCharMethodA(jobject obj, jclass clazz,
									jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualCharMethodA(&this,obj,clazz,
													methodID,args);
	}

	jshort CallNonvirtualShortMethod(jobject obj, jclass clazz,
									 jmethodID methodID, ...) const {
		va_list args;
		jshort result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualShortMethodV(&this,obj,clazz,
													   methodID,args);
		va_end(args);
		return result;
	}
	jshort CallNonvirtualShortMethodV(jobject obj, jclass clazz,
									  jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualShortMethodV(&this,obj,clazz,
													 methodID,args);
	}
	jshort CallNonvirtualShortMethodA(jobject obj, jclass clazz,
									  jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualShortMethodA(&this,obj,clazz,
													 methodID,args);
	}

	jint CallNonvirtualIntMethod(jobject obj, jclass clazz,
								 jmethodID methodID, ...) const {
		va_list args;
		jint result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualIntMethodV(&this,obj,clazz,
													 methodID,args);
		va_end(args);
		return result;
	}
	jint CallNonvirtualIntMethodV(jobject obj, jclass clazz,
								  jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualIntMethodV(&this,obj,clazz,
												   methodID,args);
	}
	jint CallNonvirtualIntMethodA(jobject obj, jclass clazz,
								  jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualIntMethodA(&this,obj,clazz,
												   methodID,args);
	}

	jlong CallNonvirtualLongMethod(jobject obj, jclass clazz,
								   jmethodID methodID, ...) const {
		va_list args;
		jlong result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualLongMethodV(&this,obj,clazz,
													  methodID,args);
		va_end(args);
		return result;
	}
	jlong CallNonvirtualLongMethodV(jobject obj, jclass clazz,
									jmethodID methodID, va_list args) const {
		return functions.CallNonvirtualLongMethodV(&this,obj,clazz,
													methodID,args);
	}
	jlong CallNonvirtualLongMethodA(jobject obj, jclass clazz,
									jmethodID methodID, const(jvalue) * args) const {
		return functions.CallNonvirtualLongMethodA(&this,obj,clazz,
													methodID,args);
	}

	jfloat CallNonvirtualFloatMethod(jobject obj, jclass clazz,
									 jmethodID methodID, ...) const {
		va_list args;
		jfloat result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualFloatMethodV(&this,obj,clazz,
													   methodID,args);
		va_end(args);
		return result;
	}
	jfloat CallNonvirtualFloatMethodV(jobject obj, jclass clazz,
									  jmethodID methodID,
									  va_list args) const {
		return functions.CallNonvirtualFloatMethodV(&this,obj,clazz,
													 methodID,args);
	}
	jfloat CallNonvirtualFloatMethodA(jobject obj, jclass clazz,
									  jmethodID methodID,
									  const(jvalue) * args) const {
		return functions.CallNonvirtualFloatMethodA(&this,obj,clazz,
													 methodID,args);
	}

	jdouble CallNonvirtualDoubleMethod(jobject obj, jclass clazz,
									   jmethodID methodID, ...) const {
		va_list args;
		jdouble result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallNonvirtualDoubleMethodV(&this,obj,clazz,
														methodID,args);
		va_end(args);
		return result;
	}
	jdouble CallNonvirtualDoubleMethodV(jobject obj, jclass clazz,
										jmethodID methodID,
										va_list args) const {
		return functions.CallNonvirtualDoubleMethodV(&this,obj,clazz,
													  methodID,args);
	}
	jdouble CallNonvirtualDoubleMethodA(jobject obj, jclass clazz,
										jmethodID methodID,
										const(jvalue) * args) const {
		return functions.CallNonvirtualDoubleMethodA(&this,obj,clazz,
													  methodID,args);
	}

	void CallNonvirtualVoidMethod(jobject obj, jclass clazz,
								  jmethodID methodID, ...) const {
		va_list args;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		functions.CallNonvirtualVoidMethodV(&this,obj,clazz,methodID,args);
		va_end(args);
	}
	void CallNonvirtualVoidMethodV(jobject obj, jclass clazz,
								   jmethodID methodID,
								   va_list args) const {
		functions.CallNonvirtualVoidMethodV(&this,obj,clazz,methodID,args);
	}
	void CallNonvirtualVoidMethodA(jobject obj, jclass clazz,
								   jmethodID methodID,
								   const(jvalue) * args) const {
		functions.CallNonvirtualVoidMethodA(&this,obj,clazz,methodID,args);
	}

	jfieldID GetFieldID(jclass clazz, const(char) *name,
						const(char) *sig) const {
		return functions.GetFieldID(&this,clazz,name,sig);
	}

	jobject GetObjectField(jobject obj, jfieldID fieldID) const {
		return functions.GetObjectField(&this,obj,fieldID);
	}
	jboolean GetBooleanField(jobject obj, jfieldID fieldID) const {
		return functions.GetBooleanField(&this,obj,fieldID);
	}
	jbyte GetByteField(jobject obj, jfieldID fieldID) const {
		return functions.GetByteField(&this,obj,fieldID);
	}
	jchar GetCharField(jobject obj, jfieldID fieldID) const {
		return functions.GetCharField(&this,obj,fieldID);
	}
	jshort GetShortField(jobject obj, jfieldID fieldID) const {
		return functions.GetShortField(&this,obj,fieldID);
	}
	jint GetIntField(jobject obj, jfieldID fieldID) const {
		return functions.GetIntField(&this,obj,fieldID);
	}
	jlong GetLongField(jobject obj, jfieldID fieldID) const {
		return functions.GetLongField(&this,obj,fieldID);
	}
	jfloat GetFloatField(jobject obj, jfieldID fieldID) const {
		return functions.GetFloatField(&this,obj,fieldID);
	}
	jdouble GetDoubleField(jobject obj, jfieldID fieldID) const {
		return functions.GetDoubleField(&this,obj,fieldID);
	}

	void SetObjectField(jobject obj, jfieldID fieldID, jobject val) const {
		functions.SetObjectField(&this,obj,fieldID,val);
	}
	void SetBooleanField(jobject obj, jfieldID fieldID,
						 jboolean val) const {
		functions.SetBooleanField(&this,obj,fieldID,val);
	}
	void SetByteField(jobject obj, jfieldID fieldID,
					  jbyte val) const {
		functions.SetByteField(&this,obj,fieldID,val);
	}
	void SetCharField(jobject obj, jfieldID fieldID,
					  jchar val) const {
		functions.SetCharField(&this,obj,fieldID,val);
	}
	void SetShortField(jobject obj, jfieldID fieldID,
					   jshort val) const {
		functions.SetShortField(&this,obj,fieldID,val);
	}
	void SetIntField(jobject obj, jfieldID fieldID,
					 jint val) const {
		functions.SetIntField(&this,obj,fieldID,val);
	}
	void SetLongField(jobject obj, jfieldID fieldID,
					  jlong val) const {
		functions.SetLongField(&this,obj,fieldID,val);
	}
	void SetFloatField(jobject obj, jfieldID fieldID,
					   jfloat val) const {
		functions.SetFloatField(&this,obj,fieldID,val);
	}
	void SetDoubleField(jobject obj, jfieldID fieldID,
						jdouble val) const {
		functions.SetDoubleField(&this,obj,fieldID,val);
	}

	jmethodID GetStaticMethodID(jclass clazz, const(char) *name,
								const(char) *sig) const {
		return functions.GetStaticMethodID(&this,clazz,name,sig);
	}

	jobject CallStaticObjectMethod(jclass clazz, jmethodID methodID,
							 ...) const {
		va_list args;
		jobject result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticObjectMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jobject CallStaticObjectMethodV(jclass clazz, jmethodID methodID,
							  va_list args) const {
		return functions.CallStaticObjectMethodV(&this,clazz,methodID,args);
	}
	jobject CallStaticObjectMethodA(jclass clazz, jmethodID methodID,
							  const(jvalue) *args) const {
		return functions.CallStaticObjectMethodA(&this,clazz,methodID,args);
	}

	jboolean CallStaticBooleanMethod(jclass clazz,
									 jmethodID methodID, ...) const {
		va_list args;
		jboolean result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticBooleanMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jboolean CallStaticBooleanMethodV(jclass clazz,
									  jmethodID methodID, va_list args) const {
		return functions.CallStaticBooleanMethodV(&this,clazz,methodID,args);
	}
	jboolean CallStaticBooleanMethodA(jclass clazz,
									  jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticBooleanMethodA(&this,clazz,methodID,args);
	}

	jbyte CallStaticByteMethod(jclass clazz,
							   jmethodID methodID, ...) const {
		va_list args;
		jbyte result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticByteMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jbyte CallStaticByteMethodV(jclass clazz,
								jmethodID methodID, va_list args) const {
		return functions.CallStaticByteMethodV(&this,clazz,methodID,args);
	}
	jbyte CallStaticByteMethodA(jclass clazz,
								jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticByteMethodA(&this,clazz,methodID,args);
	}

	jchar CallStaticCharMethod(jclass clazz,
							   jmethodID methodID, ...) const {
		va_list args;
		jchar result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticCharMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jchar CallStaticCharMethodV(jclass clazz,
								jmethodID methodID, va_list args) const {
		return functions.CallStaticCharMethodV(&this,clazz,methodID,args);
	}
	jchar CallStaticCharMethodA(jclass clazz,
								jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticCharMethodA(&this,clazz,methodID,args);
	}

	jshort CallStaticShortMethod(jclass clazz,
								 jmethodID methodID, ...) const {
		va_list args;
		jshort result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticShortMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jshort CallStaticShortMethodV(jclass clazz,
								  jmethodID methodID, va_list args) const {
		return functions.CallStaticShortMethodV(&this,clazz,methodID,args);
	}
	jshort CallStaticShortMethodA(jclass clazz,
								  jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticShortMethodA(&this,clazz,methodID,args);
	}

	jint CallStaticIntMethod(jclass clazz,
							 jmethodID methodID, ...) const {
		va_list args;
		jint result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticIntMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jint CallStaticIntMethodV(jclass clazz,
							  jmethodID methodID, va_list args) const {
		return functions.CallStaticIntMethodV(&this,clazz,methodID,args);
	}
	jint CallStaticIntMethodA(jclass clazz,
							  jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticIntMethodA(&this,clazz,methodID,args);
	}

	jlong CallStaticLongMethod(jclass clazz,
							   jmethodID methodID, ...) const {
		va_list args;
		jlong result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticLongMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jlong CallStaticLongMethodV(jclass clazz,
								jmethodID methodID, va_list args) const {
		return functions.CallStaticLongMethodV(&this,clazz,methodID,args);
	}
	jlong CallStaticLongMethodA(jclass clazz,
								jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticLongMethodA(&this,clazz,methodID,args);
	}

	jfloat CallStaticFloatMethod(jclass clazz,
								 jmethodID methodID, ...) const {
		va_list args;
		jfloat result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticFloatMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jfloat CallStaticFloatMethodV(jclass clazz,
								  jmethodID methodID, va_list args) const {
		return functions.CallStaticFloatMethodV(&this,clazz,methodID,args);
	}
	jfloat CallStaticFloatMethodA(jclass clazz,
								  jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticFloatMethodA(&this,clazz,methodID,args);
	}

	jdouble CallStaticDoubleMethod(jclass clazz,
								   jmethodID methodID, ...) const {
		va_list args;
		jdouble result;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		result = functions.CallStaticDoubleMethodV(&this,clazz,methodID,args);
		va_end(args);
		return result;
	}
	jdouble CallStaticDoubleMethodV(jclass clazz,
									jmethodID methodID, va_list args) const {
		return functions.CallStaticDoubleMethodV(&this,clazz,methodID,args);
	}
	jdouble CallStaticDoubleMethodA(jclass clazz,
									jmethodID methodID, const(jvalue) *args) const {
		return functions.CallStaticDoubleMethodA(&this,clazz,methodID,args);
	}

	void CallStaticVoidMethod(jclass cls, jmethodID methodID, ...) const {
		va_list args;
		version(X86_64) {
			va_start(args, __va_argsave);
		}
		else version(X86) {
			va_start(args, methodID);
		}
		else
			static assert(false, "Unsupported platform");
		functions.CallStaticVoidMethodV(&this,cls,methodID,args);
		va_end(args);
	}
	void CallStaticVoidMethodV(jclass cls, jmethodID methodID,
							   va_list args) const {
		functions.CallStaticVoidMethodV(&this,cls,methodID,args);
	}
	void CallStaticVoidMethodA(jclass cls, jmethodID methodID,
							   const(jvalue) * args) const {
		functions.CallStaticVoidMethodA(&this,cls,methodID,args);
	}

	jfieldID GetStaticFieldID(jclass clazz, const(char) *name,
							  const(char) *sig) const {
		return functions.GetStaticFieldID(&this,clazz,name,sig);
	}
	jobject GetStaticObjectField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticObjectField(&this,clazz,fieldID);
	}
	jboolean GetStaticBooleanField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticBooleanField(&this,clazz,fieldID);
	}
	jbyte GetStaticByteField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticByteField(&this,clazz,fieldID);
	}
	jchar GetStaticCharField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticCharField(&this,clazz,fieldID);
	}
	jshort GetStaticShortField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticShortField(&this,clazz,fieldID);
	}
	jint GetStaticIntField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticIntField(&this,clazz,fieldID);
	}
	jlong GetStaticLongField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticLongField(&this,clazz,fieldID);
	}
	jfloat GetStaticFloatField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticFloatField(&this,clazz,fieldID);
	}
	jdouble GetStaticDoubleField(jclass clazz, jfieldID fieldID) const {
		return functions.GetStaticDoubleField(&this,clazz,fieldID);
	}

	void SetStaticObjectField(jclass clazz, jfieldID fieldID,
						jobject value) const {
	  functions.SetStaticObjectField(&this,clazz,fieldID,value);
	}
	void SetStaticBooleanField(jclass clazz, jfieldID fieldID,
						jboolean value) const {
	  functions.SetStaticBooleanField(&this,clazz,fieldID,value);
	}
	void SetStaticByteField(jclass clazz, jfieldID fieldID,
						jbyte value) const {
	  functions.SetStaticByteField(&this,clazz,fieldID,value);
	}
	void SetStaticCharField(jclass clazz, jfieldID fieldID,
						jchar value) const {
	  functions.SetStaticCharField(&this,clazz,fieldID,value);
	}
	void SetStaticShortField(jclass clazz, jfieldID fieldID,
						jshort value) const {
	  functions.SetStaticShortField(&this,clazz,fieldID,value);
	}
	void SetStaticIntField(jclass clazz, jfieldID fieldID,
						jint value) const {
	  functions.SetStaticIntField(&this,clazz,fieldID,value);
	}
	void SetStaticLongField(jclass clazz, jfieldID fieldID,
						jlong value) const {
	  functions.SetStaticLongField(&this,clazz,fieldID,value);
	}
	void SetStaticFloatField(jclass clazz, jfieldID fieldID,
						jfloat value) const {
	  functions.SetStaticFloatField(&this,clazz,fieldID,value);
	}
	void SetStaticDoubleField(jclass clazz, jfieldID fieldID,
						jdouble value) const {
	  functions.SetStaticDoubleField(&this,clazz,fieldID,value);
	}

	jstring NewString(const(jchar) *unicode, jsize len) const {
		return functions.NewString(&this,unicode,len);
	}
	jsize GetStringLength(jstring str) const {
		return functions.GetStringLength(&this,str);
	}
	const(jchar) *GetStringChars(jstring str, jboolean *isCopy) const {
		return functions.GetStringChars(&this,str,isCopy);
	}
	void ReleaseStringChars(jstring str, const(jchar) *chars) const {
		functions.ReleaseStringChars(&this,str,chars);
	}

	jstring NewStringUTF(const(char) *utf) const {
		return functions.NewStringUTF(&this,utf);
	}
	jsize GetStringUTFLength(jstring str) const {
		return functions.GetStringUTFLength(&this,str);
	}
	const(char)* GetStringUTFChars(jstring str, jboolean *isCopy) const {
		return functions.GetStringUTFChars(&this,str,isCopy);
	}
	void ReleaseStringUTFChars(jstring str, const(char)* chars) const {
		functions.ReleaseStringUTFChars(&this,str,chars);
	}

	jsize GetArrayLength(jarray array) const {
		return functions.GetArrayLength(&this,array);
	}

	jobjectArray NewObjectArray(jsize len, jclass clazz,
								jobject init) const {
		return functions.NewObjectArray(&this,len,clazz,init);
	}
	jobject GetObjectArrayElement(jobjectArray array, jsize index) const {
		return functions.GetObjectArrayElement(&this,array,index);
	}
	void SetObjectArrayElement(jobjectArray array, jsize index,
							   jobject val) const {
		functions.SetObjectArrayElement(&this,array,index,val);
	}

	jbooleanArray NewBooleanArray(jsize len) const {
		return functions.NewBooleanArray(&this,len);
	}
	jbyteArray NewByteArray(jsize len) const {
		return functions.NewByteArray(&this,len);
	}
	jcharArray NewCharArray(jsize len) const {
		return functions.NewCharArray(&this,len);
	}
	jshortArray NewShortArray(jsize len) const {
		return functions.NewShortArray(&this,len);
	}
	jintArray NewIntArray(jsize len) const {
		return functions.NewIntArray(&this,len);
	}
	jlongArray NewLongArray(jsize len) const {
		return functions.NewLongArray(&this,len);
	}
	jfloatArray NewFloatArray(jsize len) const {
		return functions.NewFloatArray(&this,len);
	}
	jdoubleArray NewDoubleArray(jsize len) const {
		return functions.NewDoubleArray(&this,len);
	}

	jboolean * GetBooleanArrayElements(jbooleanArray array, jboolean *isCopy) const {
		return functions.GetBooleanArrayElements(&this,array,isCopy);
	}
	jbyte * GetByteArrayElements(jbyteArray array, jboolean *isCopy) const {
		return functions.GetByteArrayElements(&this,array,isCopy);
	}
	jchar * GetCharArrayElements(jcharArray array, jboolean *isCopy) const {
		return functions.GetCharArrayElements(&this,array,isCopy);
	}
	jshort * GetShortArrayElements(jshortArray array, jboolean *isCopy) const {
		return functions.GetShortArrayElements(&this,array,isCopy);
	}
	jint * GetIntArrayElements(jintArray array, jboolean *isCopy) const {
		return functions.GetIntArrayElements(&this,array,isCopy);
	}
	jlong * GetLongArrayElements(jlongArray array, jboolean *isCopy) const {
		return functions.GetLongArrayElements(&this,array,isCopy);
	}
	jfloat * GetFloatArrayElements(jfloatArray array, jboolean *isCopy) const {
		return functions.GetFloatArrayElements(&this,array,isCopy);
	}
	jdouble * GetDoubleArrayElements(jdoubleArray array, jboolean *isCopy) const {
		return functions.GetDoubleArrayElements(&this,array,isCopy);
	}

	void ReleaseBooleanArrayElements(jbooleanArray array,
									 jboolean *elems,
									 jint mode) const {
		functions.ReleaseBooleanArrayElements(&this,array,elems,mode);
	}
	void ReleaseByteArrayElements(jbyteArray array,
								  jbyte *elems,
								  jint mode) const {
		functions.ReleaseByteArrayElements(&this,array,elems,mode);
	}
	void ReleaseCharArrayElements(jcharArray array,
								  jchar *elems,
								  jint mode) const {
		functions.ReleaseCharArrayElements(&this,array,elems,mode);
	}
	void ReleaseShortArrayElements(jshortArray array,
								   jshort *elems,
								   jint mode) const {
		functions.ReleaseShortArrayElements(&this,array,elems,mode);
	}
	void ReleaseIntArrayElements(jintArray array,
								 jint *elems,
								 jint mode) const {
		functions.ReleaseIntArrayElements(&this,array,elems,mode);
	}
	void ReleaseLongArrayElements(jlongArray array,
								  jlong *elems,
								  jint mode) const {
		functions.ReleaseLongArrayElements(&this,array,elems,mode);
	}
	void ReleaseFloatArrayElements(jfloatArray array,
								   jfloat *elems,
								   jint mode) const {
		functions.ReleaseFloatArrayElements(&this,array,elems,mode);
	}
	void ReleaseDoubleArrayElements(jdoubleArray array,
									jdouble *elems,
									jint mode) const {
		functions.ReleaseDoubleArrayElements(&this,array,elems,mode);
	}

	void GetBooleanArrayRegion(jbooleanArray array,
							   jsize start, jsize len, jboolean *buf) const {
		functions.GetBooleanArrayRegion(&this,array,start,len,buf);
	}
	void GetByteArrayRegion(jbyteArray array,
							jsize start, jsize len, jbyte *buf) const {
		functions.GetByteArrayRegion(&this,array,start,len,buf);
	}
	void GetCharArrayRegion(jcharArray array,
							jsize start, jsize len, jchar *buf) const {
		functions.GetCharArrayRegion(&this,array,start,len,buf);
	}
	void GetShortArrayRegion(jshortArray array,
							 jsize start, jsize len, jshort *buf) const {
		functions.GetShortArrayRegion(&this,array,start,len,buf);
	}
	void GetIntArrayRegion(jintArray array,
						   jsize start, jsize len, jint *buf) const {
		functions.GetIntArrayRegion(&this,array,start,len,buf);
	}
	void GetLongArrayRegion(jlongArray array,
							jsize start, jsize len, jlong *buf) const {
		functions.GetLongArrayRegion(&this,array,start,len,buf);
	}
	void GetFloatArrayRegion(jfloatArray array,
							 jsize start, jsize len, jfloat *buf) const {
		functions.GetFloatArrayRegion(&this,array,start,len,buf);
	}
	void GetDoubleArrayRegion(jdoubleArray array,
							  jsize start, jsize len, jdouble *buf) const {
		functions.GetDoubleArrayRegion(&this,array,start,len,buf);
	}

	void SetBooleanArrayRegion(jbooleanArray array, jsize start, jsize len,
							   const(jboolean) *buf) const {
		functions.SetBooleanArrayRegion(&this,array,start,len,buf);
	}
	void SetByteArrayRegion(jbyteArray array, jsize start, jsize len,
							const(jbyte) *buf) const {
		functions.SetByteArrayRegion(&this,array,start,len,buf);
	}
	void SetCharArrayRegion(jcharArray array, jsize start, jsize len,
							const(jchar) *buf) const {
		functions.SetCharArrayRegion(&this,array,start,len,buf);
	}
	void SetShortArrayRegion(jshortArray array, jsize start, jsize len,
							 const(jshort) *buf) const {
		functions.SetShortArrayRegion(&this,array,start,len,buf);
	}
	void SetIntArrayRegion(jintArray array, jsize start, jsize len,
						   const(jint) *buf) const {
		functions.SetIntArrayRegion(&this,array,start,len,buf);
	}
	void SetLongArrayRegion(jlongArray array, jsize start, jsize len,
							const(jlong) *buf) const {
		functions.SetLongArrayRegion(&this,array,start,len,buf);
	}
	void SetFloatArrayRegion(jfloatArray array, jsize start, jsize len,
							 const(jfloat) *buf) const {
		functions.SetFloatArrayRegion(&this,array,start,len,buf);
	}
	void SetDoubleArrayRegion(jdoubleArray array, jsize start, jsize len,
							  const(jdouble) *buf) const {
		functions.SetDoubleArrayRegion(&this,array,start,len,buf);
	}

	jint RegisterNatives(jclass clazz, const(JNINativeMethod) *methods,
						 jint nMethods) const {
		return functions.RegisterNatives(&this,clazz,methods,nMethods);
	}
	jint UnregisterNatives(jclass clazz) const {
		return functions.UnregisterNatives(&this,clazz);
	}

	jint MonitorEnter(jobject obj) const {
		return functions.MonitorEnter(&this,obj);
	}
	jint MonitorExit(jobject obj) const {
		return functions.MonitorExit(&this,obj);
	}

	jint GetJavaVM(JavaVM **vm) const {
		return functions.GetJavaVM(&this,vm);
	}

	void GetStringRegion(jstring str, jsize start, jsize len, jchar *buf) const {
		functions.GetStringRegion(&this,str,start,len,buf);
	}
	void GetStringUTFRegion(jstring str, jsize start, jsize len, char *buf) const {
		functions.GetStringUTFRegion(&this,str,start,len,buf);
	}

	void * GetPrimitiveArrayCritical(jarray array, jboolean *isCopy) const {
		return functions.GetPrimitiveArrayCritical(&this,array,isCopy);
	}
	void ReleasePrimitiveArrayCritical(jarray array, void *carray, jint mode) const {
		functions.ReleasePrimitiveArrayCritical(&this,array,carray,mode);
	}

	const(jchar) * GetStringCritical(jstring string, jboolean *isCopy) const {
		return functions.GetStringCritical(&this,string,isCopy);
	}
	void ReleaseStringCritical(jstring string, const(jchar) *cstring) const {
		functions.ReleaseStringCritical(&this,string,cstring);
	}

	jweak NewWeakGlobalRef(jobject obj) const {
		return functions.NewWeakGlobalRef(&this,obj);
	}
	void DeleteWeakGlobalRef(jweak _ref) const {
		functions.DeleteWeakGlobalRef(&this,_ref);
	}

	jboolean ExceptionCheck() const {
		return functions.ExceptionCheck(&this);
	}

	jobject NewDirectByteBuffer(void* address, jlong capacity) const {
		return functions.NewDirectByteBuffer(&this, address, capacity);
	}
	void* GetDirectBufferAddress(jobject buf) const {
		return functions.GetDirectBufferAddress(&this, buf);
	}
	jlong GetDirectBufferCapacity(jobject buf) const {
		return functions.GetDirectBufferCapacity(&this, buf);
	}
	jobjectRefType GetObjectRefType(jobject obj) const {
		return functions.GetObjectRefType(&this, obj);
	}

};

alias JNIEnv_ JNIEnv;


struct JavaVMOption {
	char *optionString;
	void *extraInfo;
}

struct JavaVMInitArgs {
	jint _version;
	jint nOptions;
	JavaVMOption *options;
	jboolean ignoreUnrecognized;
}

struct JavaVMAttachArgs {
	jint _version;
	char *name;
	jobject group;
}


struct JNIInvokeInterface_ {
	void *reserved0;
	void *reserved1;
	void *reserved2;
	jint  function(const(JavaVM_) *vm)DestroyJavaVM;
	jint  function(const(JavaVM_) *vm, void **penv, void *args)AttachCurrentThread;
	jint  function(const(JavaVM_) *vm)DetachCurrentThread;
	jint  function(const(JavaVM_) *vm, void **penv, jint _version)GetEnv;
	jint  function(const(JavaVM_) *vm, void **penv, void *args)AttachCurrentThreadAsDaemon;
}

struct JavaVM_ {
	const JNIInvokeInterface_ *functions;

	jint DestroyJavaVM() const {
		return functions.DestroyJavaVM(&this);
	}
	jint AttachCurrentThread(void **penv, void *args) const {
		return functions.AttachCurrentThread(&this, penv, args);
	}
	jint DetachCurrentThread() const {
		return functions.DetachCurrentThread(&this);
	}

	jint GetEnv(void **penv, jint _version) const {
		return functions.GetEnv(&this, penv, _version);
	}
	jint AttachCurrentThreadAsDaemon(void **penv, void *args) const {
		return functions.AttachCurrentThreadAsDaemon(&this, penv, args);
	}
};

alias JavaVM_ JavaVM;


jint JNI_GetDefaultJavaVMInitArgs(void *args);
jint JNI_CreateJavaVM(JavaVM_ **pvm, void **penv, void *args);
jint JNI_GetCreatedJavaVMs(JavaVM_ **, jsize , jsize *);

/* Defined by native libraries. */
jint JNI_OnLoad(JavaVM_ *vm, void *reserved);
void JNI_OnUnload(JavaVM_ *vm, void *reserved);


const JNI_VERSION_1_1 = 0x00010001;
const JNI_VERSION_1_2 = 0x00010002;
const JNI_VERSION_1_4 = 0x00010004;
const JNI_VERSION_1_6 = 0x00010006;

}
