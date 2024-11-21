# Flutter-specific rules
-keep class io.flutter.** { *; }
-keep class com.google.firebase.** { *; }
-keepattributes *Annotation*

# Prevent obfuscation of Flutter method channels
-keepclassmembers class * {
    @io.flutter.embedding.engine.plugins.GeneratedPluginRegistrant <methods>;
}
