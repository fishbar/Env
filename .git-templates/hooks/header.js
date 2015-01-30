#!/usr/bin/env node
var fs = require('fs');
var argv = process.argv;

var obj = {
  user: argv[2],
  email: argv[3],
  date: argv[4],
  project: argv[5],
  file: argv[6],
  year: new Date().getFullYear()
};

if (!obj.file.match(/\.(js|css|php|java)$/)) {
  process.exit(0);
}

var header = [
'/*!\n\
 * %project%: %file%\n\
 * Authors  : %user% <%email%> (https://github.com/fishbar)\n\
 * Create   : %date%\n\
 * CopyRight %year% (c) Alibaba Group\n\
 */\n',
 '/*!\n\
 * %project%: %file%\n\
 * Authors  : %user% <%email%> (https://github.com/fishbar)\n\
 * Create   : %date%\n\
 * CopyRight %year% (c) Fish And Other Contributors\n\
 */\n'
 ];

 var cnt;
 try {
  cnt = fs.readFileSync(obj.file).toString();
 } catch (e) {
  process.exit(0);
 }

 if (cnt.match(/^\s*\/\*\!/g)) {
  // already have file descriptions, exit now
  // console.log('no match file', obj.file);
  process.exit(0);
 }
 var head = (obj.email.match(/taobao|alibaba/) ? header[0] : header[1]).replace(/%(\w+)%/g, function (m0, m1) {
  return obj[m1];
 });
 fs.writeFileSync(obj.file, head + cnt);
 console.log('  add file description:', obj.file);
 process.exit(1);
