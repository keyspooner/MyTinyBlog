# MyTinyBlog
This is a MOOC project to create a blog website using Pharo, Seaside, Mongo, and NeoJSON. The application will be exposed using a REST server.

Load project by running the below in Pharo's playground:

```smalltalk
Metacello new
   baseline: 'MyTinyBlog';
   repository: 'github://keyspooner/MyTinyBlog/src';
   onWarning: [ :ex | ];
   onConflict: [ :ex | ex useIncoming ];
   onUpgrade: [ :ex |  ex useIncoming ];
   onDowngrade: [ :ex |   ex useLoaded ];
   onLock:[ :ex |    ];
   load.
   ```
