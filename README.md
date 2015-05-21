# primus-objc-swift-helloworld
Hello world [Primus](https://github.com/primus/primus) with Swift bridge with [Objective-C](https://github.com/seegno/primus-objc) via [ActionHeroJS](http://www.actionherojs.com/)
![ActionHeroJS](https://cloud.githubusercontent.com/assets/97060/7701128/46d71f9e-fe4e-11e4-83b5-923603acd917.png)
Prerequisite
---
* Client : [Primus Objective-C](https://github.com/seegno/primus-objc)
* Server : [ActionHeroJS](http://www.actionherojs.com/)
* Package Manager : [CocoaPod](https://cocoapods.org/)

Step
---
Clone this repos
```shell
$ git clone git@github.com:katopz/primus-objc-swift-helloworld.git
```
Go to `primus-objc-swift-helloworld` folder
```shell
$ cd primus-objc-swift-helloworld
```
Install pod (in `primus-objc-swift-helloworld` folder)
```shell
$ pod install
```
*But it seem like pod is not in love with Swift yet so try to copy all folders in Pods folder to Swift project as refferrence.

Start ActionHeroJS Server (in `ActionHeroJS` folder)
```shell
$ npm start
```
Watching server up and running and smile :D
```shell
> my_actionhero_project@0.0.1 start /Users/katopz/git/actionhero
> actionhero start

info: actionhero >> start
2015-05-19 15:36:11 - notice: *** starting actionhero ***
2015-05-19 15:36:11 - warning: running with fakeredis
2015-05-19 15:36:13 - notice: pid: 10994
2015-05-19 15:36:13 - notice: server ID: 192.168.2.63
2015-05-19 15:36:13 - info: ensuring the existence of the chatRoom: defaultRoom
2015-05-19 15:36:13 - info: ensuring the existence of the chatRoom: anotherRoom
2015-05-19 15:36:13 - notice: starting server: web
2015-05-19 15:36:13 - notice: starting server: websocket
2015-05-19 15:36:15 - notice: environment: development
2015-05-19 15:36:15 - notice: *** Server Started @ 2015-05-19 15:36:15 ***
2015-05-19 15:36:15 - info: actionhero member 192.168.2.63 has joined the cluster
```
Open [http://127.0.0.1:8080/chat.html](http://127.0.0.1:8080/chat.html) with Browser, console log will show...
```
connected!
```
Open `primus-objc-swift-helloworld.xcworkspace` with XCode and run then console will show...
```
2015-05-19 17:23:34.853 primus-objc-swift-helloworld[12767:1889850] [open] - The connection has been established.
2015-05-19 17:23:34.855 primus-objc-swift-helloworld[12767:1889850] [data] - Received data: {
    context = api;
    welcome = "Hello! Welcome to the actionhero api";
}
2015-05-19 17:23:34.857 primus-objc-swift-helloworld[12767:1889850] [data] - Received data: {
    context = response;
    data =     {
        connectedAt = 1432031014837;
        fingerprint = "<null>";
        id = "30a2046f-11a8-466a-b6da-9ab934590427";
        params =         {
        };
        pendingActions = 0;
        remoteIP = "127.0.0.1";
        remotePort = 54441;
        rooms =         (
        );
        totalActions = 0;
    };
    messageCount = 1;
    status = OK;
}
2015-05-19 17:23:34.866 primus-objc-swift-helloworld[12767:1889850] [data] - Received data: {
    context = response;
    data = 1;
    messageCount = 2;
    status = OK;
}
2015-05-19 17:23:34.869 primus-objc-swift-helloworld[12767:1889850] [data] - Received data: {
    context = response;
    messageCount = 3;
    status = OK;
}
2015-05-19 17:23:34.871 primus-objc-swift-helloworld[12767:1889850] [data] - Received data: {
    context = user;
    from = "30a2046f-11a8-466a-b6da-9ab934590427";
    message = "HelloWorld from Swift!";
    room = defaultRoom;
    sentAt = 1432031014867;
}
```
And at server via terminal will show...
```shell
2015-05-19 17:23:34 - info: [server: websocket] new connection to=127.0.0.1
```

Viola! Happy Coding!
