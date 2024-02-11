# **Anatomy of an Android applications**

The anatomy of an Android application are :

1)  **Activities:** Activities represent individual screens or UI
    components in an Android application. Each activity is typically
    implemented as a Java class that extends the Activity class.

***Example:*** Suppose we have an application with a login screen. We should create a `LoginActivity` class that extends `Activity` and defines the layout and functionality of the login screen.

```java
public class LoginActivity extends Activity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_login);

    // Additional initialization code
  }
}
```

2)  ***Services:*** Services are background processes that perform
    long-running operations without a user interface. They can be used
    for tasks like playing music, downloading files, or processing data.

***Example:*** Suppose we want to create a service to play background music. We should create a `MusicService` class that extends `Service` and implements the necessary logic for playing music.

```java
public class MusicService extends Service {

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // Start playing music
        return START_STICKY;
    }
}
```

3)  **Broadcast Receivers:** Broadcast receivers listen for system-wide
    broadcast messages or messages sent by other components in the
    application. They allow the application to respond to events even
    when it's not actively running.

***Example:*** Suppose we want to receive a broadcast when the
device's battery is low. We should create a `LowBatteryReceiver` class
that extends `BroadcastReceiver` and defines the logic to handle low
battery events.

```java
public class LowBatteryReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        // Handle low battery event
    }
}
```

4)  **Content Providers:** Content providers manage access to structured
    sets of data, typically stored in a SQLite database or another data
    source. They provide a standardized interface for interacting with
    data.

***Example:*** Suppose we want to create a content provider to access the user's contacts. We should define a `ContactsProvider` class that extends `ContentProvider` and implements methods to query, insert, update, and delete contacts.

```java
public class ContactsProvider extends ContentProvider {

    @Override
    public boolean onCreate() {
        // Initialize database and other resources
        return true;
    }

    @Nullable
    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        // Perform query and return cursor
        return null;
    }

    // Implement other ContentProvider methods
}
```
5)  **Manifest File:** The AndroidManifest.xml file contains essential
    information about the application, including its components,
    permissions, and other metadata.

***Example:*** In the manifest file, we should declare the activities, services, broadcast receivers, and content providers that make up your application.

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.myapp">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme">

        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

        <!-- Declare other components here -->

    </application>

</manifest>
```
> The Additional anatomy of an Android application are :

1.  **Intents :** It is an inter-application message passing framework
    for communication between android components. It is also used for
    transferring data between different Activities as well as to start a
    new service and display a list of contacts in ListView.

> *Example:* The camera application sends an intent to the operating system when the user decides to share a picture.

2.  **Widgets:** Widgets are variations of Broadcast Receivers and
    essential aspects of home screen customization. They display data
    and allow users to perform actions on them.

3.  **Views:** View is responsible for drawing and event handling. They
    are rectangular elements on the screen. Some of the views are
    EditText, ImageView Button, CheckBox and ImageButton.

## Android Terminologies

> The Android terminologies are:

1)  **Activity:** An Activity represents a single screen with a user
    interface. It's a fundamental building block of Android
    applications, facilitating interaction with the user. Activities are
    managed by the Android framework and can be transitioned between,
    stacked on top of each other.

2)  **Service:** A Service is a component that runs in the background to
    perform long-running operations or handle tasks that do not require
    a user interface. Services are used for tasks such as playing music,
    downloading files, or performing network operations. They operate
    independently of the user interface and can continue running even
    when the application is not in the foreground.

3)  **Intent:** An Intent is a messaging object used to request an
    action from another app component. It can be used to start
    activities, services, or broadcast messages to other components.
    Intents can also carry data (extras) along with the request,
    enabling communication between different components of an
    application or between different applications.

4)  **Context:** Context is an interface to global information about an
    application environment. It provides access to application-specific
    resources and classes, as well as calls to application-level
    operations such as launching activities, broadcasting and receiving
    intents, etc. Context is essential for accessing resources, starting
    activities, obtaining system services, and other operations within
    an Android application.

5)  **Broadcast Receiver:** A Broadcast Receiver is a component that
    listens for system-wide broadcast messages or messages sent by other
    applications. It allows the application to respond to events even
    when the application is not currently running. Broadcast receivers
    can perform tasks such as initiating an activity, starting a
    service, or updating the user interface based on incoming messages.

6)  **Content Provider:** A Content Provider is a component that manages
    access to a structured set of data, typically stored in a SQLite
    database or another data source. It provides a standardized
    interface for interacting with data, allowing different applications
    to access and manipulate the same data source. Content providers are
    commonly used to share data between different applications or to
    provide data to system components such as the Contacts or Calendar
    apps.

7)  **Android Manifest File:** The AndroidManifest.xml file is an
    essential component of every Android application. It contains
    essential information about the application, including the
    application's package name, version number, permissions required,
    and the components (activities, services, broadcast receivers,
    content providers) that make up the application. The manifest file
    also declares any permissions that the application requires to
    access system resources or perform certain actions.

## Application Context

The Application Context in Android is a crucial concept that provides
access to application-level resources and operations. Here's a detailed
explanation:

**What is Application Context?**

The Application Context is an instance of the Context class,
representing the entire application environment. It is a global context
for an application, meaning it is available throughout the entire
lifecycle of the application. Unlike an Activity Context, which is tied
to the lifecycle of an activity and may be destroyed and recreated, the
Application Context remains constant throughout the lifespan of the
application.

**<u>Purpose and Usage</u>**

1)  **Accessing Resources:** The Application Context allows access to
    application-specific resources such as strings, colors, dimensions,
    and drawables. This is particularly useful when you need to access
    resources from within components that do not have direct access to a
    Context, such as classes that are not Activities or Services.

2)  **Launching Activities and Services:** The Application Context can
    be used to start activities or services from within non-activity
    classes. It's handy when you need to initiate component launches
    from places like broadcast receivers or background threads.

3)  **Accessing System Services:** Application Context provides methods
    for accessing various system services, such as the notification
    service, alarm service, and location service. These services can be
    accessed using the `getSystemService()` method, which requires an
    application context.

4)  **File and Database Operations:** Application Context is required
    for operations like accessing files and databases stored within the
    application's private directories. It's often used to open files,
    access SharedPreferences, or initialize SQLite databases.

**Obtaining Application Context:** The Application Context is typically
obtained using the `getApplicationContext()` method, which is
available in the Context class. You can obtain the Application Context
from any Context subclass, such as an Activity or a Service.

***Example:***

public class MyApplication extends Application {
``` java
@Override

public void onCreate() {

super.onCreate();

// Access application context

Context appContext = getApplicationContext();

// Access resources

String appName = appContext.getString(R.string.app_name);

// Access system service

NotificationManager notificationManager = (NotificationManager)
appContext.getSystemService(Context.NOTIFICATION_SERVICE);

// Start service using application context

appContext.startService(new Intent(appContext, MyService.class));

// Access file operations

FileInputStream fis = appContext.openFileInput("myfile.txt");

}

}
```
***Important Notes:***

- While the Application Context is extremely useful, care should be
  taken to avoid memory leaks when holding references to it for extended
  periods, especially in long-lived objects.

- It should not be used to hold onto objects with lifecycles longer than
  that of the application itself, as it can lead to memory leaks.

## Activities

Activities are a fundamental component of Android applications,
representing individual screens with which users can interact. Here's a
detailed explanation of activities:

**What is an Activity?**

An Activity is a single, focused task that the user can do within your
application. It serves as a window with a user interface for interacting
with the application's content. Each activity typically corresponds to
one screen in the application's user interface. Activities are
responsible for presenting a visual interface, handling user
interactions, and responding to lifecycle events.

**<u>Key Features and Characteristics</u>**

1)  **User Interface:** Activities are responsible for presenting the
    user interface to the user. They can contain various UI elements
    such as buttons, text fields, images, and other widgets.

2)  **Lifecycle Methods:** Activities go through a series of lifecycle
    states, including creation, starting, pausing, resuming, stopping,
    and destruction. These lifecycle states are managed by the Android
    system, and activities can react to changes in their lifecycle by
    overriding specific lifecycle methods.

3)  **Intent Handling:** Activities can be started by sending an Intent
    to the Android system. Intents specify the action to be performed
    and can contain data to be passed to the activity.

4)  **Backstack Management:** Activities are managed by the Activity
    Manager, which maintains a stack of activities known as the
    backstack.When a new activity is started, it is pushed onto the top
    of the backstack, and when the user navigates back, activities are
    popped from the stack.

5)  **Task Affinity:** Each activity has a task affinity, which
    determines the group of activities with which it can interact.
    Activities with the same task affinity are grouped together into
    tasks, allowing them to share data and interact with each other.

***Example:***
```java
public class MainActivity extends AppCompatActivity {

@Override

protected void onCreate(Bundle savedInstanceState) {

super.onCreate(savedInstanceState);

setContentView(R.layout.activity_main);

// Initialize UI components and set up event listeners

Button button = findViewById(R.id.button);

button.setOnClickListener(new View.OnClickListener() {

@Override

public void onClick(View v) {

// Perform action when button is clicked

}

});

}

}
```
**Lifecycle Methods:**

- **`onCreate()`:** Called when the activity is first created. This is
  where initialization of the activity's UI and setup of event listeners
  should occur.

- **`onStart()`:** Called when the activity is becoming visible to the
  user.

- **`onResume()`:** Called when the activity will start interacting
  with the user.

- **`onPause()`:** Called when the activity is going into the
  background, but has not been stopped yet.

- **`onStop()`:** Called when the activity is no longer visible to the
  user.

- **`onDestroy()`:** Called before the activity is destroyed.

***Important Notes:***

- Activities should be designed to be modular and focused on specific
  tasks or user interactions.

- They should follow the principle of separation of concerns, with each
  activity responsible for a specific aspect of the application's
  functionality.

- Care should be taken to manage the activity lifecycle properly to
  ensure efficient memory usage and a smooth user experience.

## Services

Android has four major components: first activity, broadcast receiver,
content provider, and services. Tasks that run in the background, like
downloading a large file, use services. Services are designed to do some
work without a user interface. Services are used for Interprocess
Communication (IPC) between Android applications. For example, playing
music, network transactions, performing file I/O, etc, all in the
background.

**<u>Declaring a Service</u>**

We must declare all services in the manifest file.

In the `<application>` element, we can add the `<service>` element as its child.

```xml
<manifest ...>

<application ...>

<service android:name=".MyService" />

...

</application>

</manifest>
```
**<u>Type Of Services</u>**

There are three‌ types of services:

1.  **Foreground Services:‌** Most of the time we need operations that
    are noticeable to us. Such operations are performed by foreground
    services.

> *Example*: Playing music in an application like Spotify is a
> foreground service.

2.  **Background Services:‌** Sometimes we need operations to be
    performed in the background. Such operations are handled by
    background services.

> *Example:* Scheduled syncing of data.

3.  **Bound Services:‌** bindServices() is called when the application
    gets bound with services. We need an interface that can allow
    interaction between the components and other things like service,
    receive results, send requests, and interaction across processes,
    with the help of IPC. Such a client-server interface is provided by
    bound services. This type of service runs until other application
    components are attached, or bound, to them. Multiple components can
    be bound to a service and in this case, the service only dies when
    all of these multiple components unbind from the service.

**<u>The Life Cycle of Android Services</u>**

There are two different types of service lifecycle in Android.

1.  **Started Service:** When an application component calls
    startService() then service will start. This type of service does
    not return any result and performs only a single operation. The
    component which has started this service gets destroyed, then this
    service runs in the background.

> Started service can be stopped in two ways:

- `stopService()` method

- `stopSelf()` method

*A service is started when **startService()** method is called by an
activity. It continues to run in the background. It is stopped when
**stopService()** method is called.*

2.  **Bound service:** We can consider this service a server in the
    client-server interface. Bound services are services that are bound
    with the application component with the help of the `bindService()`
    method. If we need to stop such service then the `unbindService()`
    method needs to be called, which unbinds all the components from the
    service.

*A service is bound when **bindService()** method is called by an
activity. When `unbindService()` method is called the component is
unbind.*

**<u>Example of Started and Bound services</u>**

For instance we play audio in background, `startService()` method is
called. When we try to get information of current audio file, we shall
bind that service that provides information regarding current audio.

![the life cycle of started service and bound service](https://cdn.jsdelivr.net/gh/thanksduck/trainMySelf@main/01Baisics/iamge1.png)


**The lifecycle of started service and bound service**

**_Lifecycle Methods:_**

- `onStartCommand():` This method is called when an activity wishes to start a service by calling startService().

- `onBind():` This method is called when another component, such as an activity, wishes to bind with the service by calling bindService().

- `onUnbind():` This method is called when all components, such as clients, are disconnected from an interface.

- `onRebind():` This method is called when new clients connect to the service.

- `onCreate():` This method is called when the service is first created using onStartCommand() or onBind().

- `onDestroy():` This method is called when the service is being destroyed.

## Intents

Intents are a fundamental component of Android applications that
facilitate communication between different components within an app or
between different apps. They are used to request an action from another
component, such as starting an activity, service, or broadcast receiver,
and can also carry data along with the request.

***There are two main types of Intents in Android: Explicit Intents and
Implicit Intents.***

**1. Explicit Intents:** Explicit Intents are used to start a specific
component within the same application by specifying the target
component's class name. They are typically used when the target
component is known at compile time. Explicit Intents are useful for
starting activities, services, or broadcast receivers within the same
application.

***Example:***
```java
// Explicit Intent to start a new activity

Intent intent = new Intent(this, SecondActivity.class);

startActivity(intent);
```
**2. Implicit Intents:** Implicit Intents are used to request an action
from another component based on an action string or data type, without
specifying the target component's name. They are useful when the
application does not have a specific target component in mind or when
the target component is not known at compile time. Implicit Intents
allow the Android system to determine the appropriate component to
handle the request based on the available components that have
registered to handle the specified action or data type.

***Example 1: Opening a web page in a browser***:
```java
// Implicit Intent to view a webpage

Intent intent = new Intent(Intent.ACTION_VIEW,
Uri.parse("https://www.example.com"));

startActivity(intent);
```
***Example 2: Sending an email:***
```java
// Implicit Intent to send an email

Intent intent = new Intent(Intent.ACTION_SEND);

intent.setType("text/plain");

intent.putExtra(Intent.EXTRA_EMAIL, new String\[\]
{"recipient@example.com"});

intent.putExtra(Intent.EXTRA_SUBJECT, "Subject");

intent.putExtra(Intent.EXTRA_TEXT, "Message body");

startActivity(Intent.createChooser(intent, "Send Email"));
```
***Example 3: Sharing content:***
```java
// Implicit Intent to share content

Intent intent = new Intent(Intent.ACTION_SEND);

intent.setType("text/plain");

intent.putExtra(Intent.EXTRA_TEXT, "Shared content");

startActivity(Intent.createChooser(intent, "Share via"));
```
**<u>Key Components of an Intent</u>**

1.  **Action:** Specifies the action to be performed, such as opening a
    web page, sending an email, or playing music.Common action constants
    are defined in the Intent class, such as `ACTION_VIEW`, `ACTION_SEND`,
    etc.

2.  **Data:** Optional data associated with the action, such as a URI,
    MIME type, or extra data. Data can be provided as a URI, a string,
    or other data types depending on the action being performed.

3.  **Extras:** Additional data that can be passed along with the intent
    as key-value pairs. Extras can be used to pass parameters, flags, or
    other information to the target component.

***Example:***
```java
// Explicit Intent to start SecondActivity

Intent explicitIntent = new Intent(MainActivity.this,
SecondActivity.class);

startActivity(explicitIntent);

// Implicit Intent to open a web page

Intent implicitIntent = new Intent(Intent.ACTION_VIEW,
Uri.parse("https://www.example.com"));

startActivity(implicitIntent);

// Intent with extras

Intent intentWithExtras = new Intent(MainActivity.this,
TargetActivity.class);

intentWithExtras.putExtra("key", "value");

startActivity(intentWithExtras);
```
**Intent Filters:** Intent filters are used to declare the types of
intents that a component can respond to.

They specify the actions, data types, and categories that the component
can handle.

Components must declare intent filters in their manifest files to be
eligible to respond to implicit intents.

**Important Notes**

- Intents provide a flexible and powerful mechanism for inter-component
  communication in Android applications.

- They can be used to trigger a wide range of actions, from starting
  activities and services to sending broadcasts and sharing data.

- Understanding how to use Intents effectively is essential for building
  feature-rich and interactive Android applications.

## Receiving and Broadcasting Intents

Receiving and broadcasting intents are crucial aspects of Android
development, allowing components to communicate with each other within
an application or between different applications on the device. Here's a
detailed explanation of receiving and broadcasting intents in Android:

**<u>Receiving Intents</u>**

1)  **Broadcast Receivers:** Broadcast Receivers are components that
    listen for and respond to broadcast messages or intents. They allow
    applications to respond to system-wide events, such as the device
    booting up, the battery being low, or a network connection being
    established. Broadcast Receivers can be registered in the
    AndroidManifest.xml file to listen for specific system broadcasts,
    or they can be registered dynamically at runtime to listen for
    custom broadcasts.

2)  **Dynamic Broadcast Receivers:** Dynamic broadcast receivers are
    registered at runtime using the `registerReceiver()` method in a
    component such as an activity or service.They are typically used to
    listen for broadcasts that are only relevant while the component is
    running, such as updates to a download progress or changes in
    network connectivity.

**<u>Broadcasting Intents</u>**

1.  **Sending Broadcasts:** Applications can send broadcast messages or
    intents using the `sendBroadcast()` method. Broadcasts can be sent
    either as explicit intents, specifying the target component to
    receive the broadcast, or as implicit intents, allowing any
    component that matches the intent filter criteria to receive the
    broadcast.

2.  **System Broadcasts:** System broadcasts are predefined by the
    Android system and are sent by the system to notify applications of
    various system events.Examples of system broadcasts include the
    device booting up, the battery level changing, the device becoming
    connected to or disconnected from a network, etc.

**<u>Intent Filters for Broadcast Receivers</u>**

Broadcast receivers specify the types of intents they can handle using
intent filters.

Intent filters declare the actions, data types, and categories that the
broadcast receiver is interested in.

When a broadcast intent is sent, the Android system compares the
intent's action, data, and category against the intent filters of
registered broadcast receivers to determine which receivers should
receive the broadcast.

***Example (Receiving Intent with Broadcast Receiver):***
```java
public class MyBroadcastReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        // Handle the received intent here
        String action = intent.getAction();
        if (action.equals(Intent.ACTION_BOOT_COMPLETED)) {
            // Perform tasks when device boots up
        }
    }

}
```
***Example (Broadcasting Intent):***
```java
Intent intent = new Intent("com.example.ACTION_CUSTOM_BROADCAST");

intent.putExtra("key", "value");

sendBroadcast(intent);
```
**Important Notes**

- Broadcast receivers are used to listen for and respond to broadcast
  messages, while broadcast intents are used to send broadcast messages.

- Broadcast receivers can be registered statically in the
  AndroidManifest.xml file or dynamically at runtime.

- Care should be taken when sending and receiving broadcasts to ensure
  that sensitive information is not exposed unintentionally and that
  broadcasts are used judiciously to avoid unnecessary system overhead.

## Android Manifest File and its Common Settings

The AndroidManifest.xml file is a crucial component of every Android
application. It provides essential information about the application to
the Android system and declares the various components and permissions
that the application requires.

**<u>Purpose of the Android Manifest File</u>**

***The AndroidManifest.xml file serves several key purposes:***

- **Declaring Application Components:** It declares the components of
  the application, including activities, services, broadcast receivers,
  and content providers.

- **Defining Application Metadata:** It specifies metadata about the
  application, such as its package name, version number, and application
  icon.

- **Requesting Permissions:** It declares permissions that the
  application requires to access certain system resources or perform
  specific actions.

- **Configuring Application Behaviors:** It configures various behaviors
  of the application, such as its entry point activity, supported screen
  orientations, and minimum and target SDK versions.

***Here are some common settings found in the AndroidManifest.xml file:***

**1. Package Name:** The `package` attribute in the `<manifest>` element specifies the unique identifier for the application. It typically follows the reverse domain name convention, such as "com.example.myapp".

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.myapp">
```
**2. Application Attributes:** The `<application>` element contains attributes that define properties of the application, such as its label, icon, theme, and whether it allows backup.

```xml
<application
    android:allowBackup="true"
    android:icon="@drawable/ic_launcher"
    android:label="@string/app_name"
    android:theme="@style/AppTheme">
```
**3. Activities:** The `<activity>` elements declare the activities that comprise the application. Each activity is specified with its name and can have additional attributes such as labels, launch modes, and intent filters.

```xml
<activity android:name=".MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
```
**4. Services:** The `<service>` elements declare services provided by the application. Services can have attributes such as names, descriptions, and whether they run in a separate process.

```xml
<service android:name=".MyService"
    android:process=":my_service_process">
</service>
```
**5. Broadcast Receivers:** The `<receiver>` elements declare broadcast receivers that listen for system-wide or application-specific broadcast messages. They can have intent filters to specify the types of broadcasts they handle.

```xml
<receiver android:name=".MyBroadcastReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED" />
    </intent-filter>
</receiver>
```
**6. Permissions:** The `<uses-permission>` elements declare the permissions required by the application to access system resources or perform certain actions. Permissions are granted by the user when the application is installed.

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```
**7. Intent Filters:** Intent filters are used to declare the types of intents that an activity, service, or broadcast receiver can handle. They specify actions, categories, and data types that the component can respond to.

```xml
<intent-filter>
    <action android:name="android.intent.action.MAIN" />
    <category android:name="android.intent.category.LAUNCHER" />
</intent-filter>
```
**8. Exported State:** The `android:exported` attribute specifies whether a component can be accessed by other applications. It should be carefully managed to prevent security vulnerabilities.

```xml
<activity android:name=".MyActivity"
    android:exported="true">
</activity>
```
**9. Application Theme:** The `android:theme` attribute in the `<application>` element specifies the default theme applied to all activities in the application.

```xml
<application
    android:theme="@style/AppTheme">
```
**10. Minimum and Target SDK Versions:** The `android:minSdkVersion` and `android:targetSdkVersion` attributes specify the minimum and target API levels that the application supports.

```xml
<uses-sdk
    android:minSdkVersion="16"
    android:targetSdkVersion="31" />
```
**Important Notes**

- The AndroidManifest.xml file serves as the entry point for the Android
  system to understand the structure and requirements of the
  application.

- Proper configuration of the manifest file is crucial for defining the
  behavior and capabilities of the application.

- Developers should carefully manage permissions, activity declarations,
  intent filters, and other settings to ensure the security,
  functionality, and usability of the application.

## Using Intent Filter

Intent filters are essential components in Android development that
allow we to declare that our component is interested in. Here's how to
use intent filters effectively in our AndroidManifest.xml file:



**1. Declaring Intent Filters:** To declare an intent filter, we include
`<intent-filter>` elements within the declaration of our activity,
service, or broadcast receiver in the AndroidManifest.xml file.

```xml
<activity android:name=".MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
```

**2. Actions:** Actions specify the general action to be performed. Common
actions include "`android.intent.action.VIEW`", "`android.intent.action.SEND`",
etc. We can include one or more `<action>` elements within the
`<intent-filter>` to declare the actions our component can handle.

```xml
<action android:name="android.intent.action.VIEW" />
```

**3. Data Types:** Data types specify the type of data our component can handle, such as a URI, MIME type, or file type. We can include one or more `<data>` elements within the `<intent-filter>` to declare the data types our component can handle.

```xml
<data android:scheme="http" />
<data android:scheme="https" />
<data android:mimeType="image/*" />
```

**4. Categories:** Categories specify additional information about the intent, such as the context in which it should be executed. Common categories include "`android.intent.category.DEFAULT`", "`android.intent.category.BROWSABLE`", etc. We can include one or more `<category>` elements within the `<intent-filter>` to declare the categories our component belongs to.

```xml
<category android:name="android.intent.category.DEFAULT" />
```

**5. Example:** Below is an example of an intent filter declared for an activity. This activity is set as the main launcher activity and can handle the "android.intent.action.MAIN" action and the "android.intent.category.LAUNCHER" category.

```xml
<activity android:name=".MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
```
**6. Multiple Intent Filters:** We can declare multiple intent filters for a single component, allowing it to handle different types of intents.

```xml
<activity android:name=".MyActivity">
    <intent-filter>
        <!-- Intent filter 1 -->
    </intent-filter>
    <intent-filter>
        <!-- Intent filter 2 -->
    </intent-filter>
</activity>
```
**7. Intent Filter Priority:** If multiple components can handle the same intent, the Android system uses the priority attribute to determine which component should handle the intent. The component with the highest priority value is chosen.

```xml
<intent-filter android:priority="100">
    <!-- Intent filter details -->
</intent-filter>
```
**8. Intent Filter Matching:** When an intent is sent, the Android system compares the intent's action, data, and categories against the intent filters of registered components to determine which component should handle the intent.

**9. Intent Filter for Broadcast Receivers:** Broadcast receivers can also declare intent filters to specify the types of broadcast messages they can handle.

```xml 
<receiver android:name=".MyBroadcastReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED" />
    </intent-filter>
</receiver>
```
**10. Intent Filter for Services:** Services can declare intent filters to specify the types of intents they can handle.

```xml
<service android:name=".MyService">
    <intent-filter>
        <action android:name="com.example.ACTION_CUSTOM_ACTION" />
    </intent-filter>
</service>
```
**Important Notes**

- Intent filters are used to declare the types of intents your component
  can handle.

- They help the Android system identify which components are suitable to
  handle a particular intent when it is sent.

- Care should be taken to specify intent filters accurately to ensure
  that your component is invoked appropriately.

## Permissions

Permissions in Android are a security feature that allows applications
to access certain resources or perform specific actions on the device.
Permissions help protect users' privacy and security by ensuring that
apps only have access to the data and system resources they need.

**1. Declaring Permissions:** Permissions are declared in the AndroidManifest.xml file using the `<uses-permission>` element. Each `<uses-permission>` element specifies a permission that the application requires to access a particular resource or perform an action.

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.CAMERA" />
```
**2. Permission Groups:** Permissions are organized into permission
groups, which group related permissions together. When an app requests a
permission that belongs to a permission group, it automatically gets
granted all permissions in that group.

**3. Dangerous Permissions:** Some permissions are considered
"dangerous" because they involve accessing sensitive user data or
performing potentially risky actions. Dangerous permissions must be
explicitly requested by the application at runtime, and the user must
grant them manually.

**4. Normal Permissions:** Normal permissions are permissions that do
not pose a significant risk to user privacy or the operation of other
apps. They are automatically granted to the application when it is
installed.

**5. Runtime Permissions:** Starting from Android 6.0 (API level 23),
dangerous permissions must be requested at runtime, even if they are
declared in the manifest. Apps must explicitly request these permissions
from the user at runtime, and the user can grant or deny them.

**6. Permission Groups Examples:**

- `android.permission-group.CALENDAR`

- `android.permission-group.CAMERA`

- `android.permission-group.CONTACTS`

- `android.permission-group.LOCATION`

- `android.permission-group.STORAGE`

**7. Checking Permissions:** Before using a permission that requires
runtime approval, it's essential to check whether the permission has
been granted by the user. We can check permissions at runtime using
methods like `checkSelfPermission()`.

**8. Requesting Permissions:** To request permissions at runtime, use
the `requestPermissions()` method. Once the user grants or denies the
requested permissions, the `onRequestPermissionsResult()` method is
called.

***Example of Runtime Permission Request:***

```java
if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)
    != PackageManager.PERMISSION_GRANTED) {
    ActivityCompat.requestPermissions(this,
        new String[]{Manifest.permission.CAMERA},
        CAMERA_PERMISSION_REQUEST_CODE);
}
```

**Important Notes**

- When declaring permissions, it's crucial to request only the
  permissions necessary for your application's functionality.

- Request dangerous permissions at runtime only when they are needed to
  avoid overwhelming users with permission requests during installation.
