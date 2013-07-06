module jni.JniHelper;

import jni.jni;
import jni.JavaVM;


struct JniHelper {
public:
	static ref JniJavaVM GetJavaVM() {
		if(javaVmInstance == null)
			javaVmInstance = new JniJavaVM();
		return *javaVmInstance;
	}
	static ref JniJavaVM GetJavaVM(string classPath) {
		if(javaVmInstance == null)
			javaVmInstance = new JniJavaVM(classPath);
		return *javaVmInstance;
	}
	static ref JniJavaVM GetJavaVM(string classPath, jint ver) {
		if(javaVmInstance == null)
			javaVmInstance = new JniJavaVM(classPath, ver);
		return *javaVmInstance;
	}

	static ref JniJavaVM GetJavaVM(JavaVM * vm) {
		if(javaVmInstance == null)
			javaVmInstance = new JniJavaVM(vm);
		return *javaVmInstance;
	}
	static ref JniJavaVM GetJavaVM(JavaVM * vm, jint ver) {
		if(javaVmInstance == null)
			javaVmInstance = new JniJavaVM(vm, ver);
		return *javaVmInstance;
	}

private:
	static JniJavaVM * javaVmInstance;
};
