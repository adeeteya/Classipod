plugins {
    id("org.jetbrains.kotlin.android") apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    // device_info_plus assumes AGP 9 always uses built-in Kotlin.
    // This project opts out, so compile the plugin's Kotlin sources
    // explicitly until the package accounts for that setting.
    if (name == "device_info_plus" &&
        providers.gradleProperty("android.builtInKotlin").orNull == "false"
    ) {
        pluginManager.apply("org.jetbrains.kotlin.android")
        extensions.configure<
            org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension
        > {
            compilerOptions {
                jvmTarget.set(
                    org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17,
                )
            }
        }
    }

    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
