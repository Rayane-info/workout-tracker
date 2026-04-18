
def connect_to_db():
    import jaydebeapi
    import jpype
    import os
    script_dir = os.path.dirname(os.path.abspath(__file__))
    jar_path = os.path.join(script_dir, "..", "lib", "h2-2.3.232.jar")
    jar_path = os.path.normpath(jar_path)
    jvm_path = r"C:\Program Files\Eclipse Adoptium\jdk-25.0.2.10-hotspot\bin\server\jvm.dll"    
    if not jpype.isJVMStarted():
        jpype.startJVM(jvm_path, "-Djava.class.path=" + jar_path)
    conn = jaydebeapi.connect(
        "org.h2.Driver",
        "jdbc:h2:./data/test;MODE=MySQL",
        ["sa", ""],
    )
    return conn