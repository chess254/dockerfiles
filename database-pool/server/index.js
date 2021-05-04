const http = require('http');
const { spawn } = require('child_process');

const PORT = process.env.DB_POOL_PORT || 8080;

const scripts = {
  mongo: {
    start: '/etc/database-pool/mongo_start.sh',
  },
  mssql: {
    start: '/etc/database-pool/mssql_start.sh',
  },
  mysql: {
    start: '/etc/database-pool/mysql_start.sh',
  },
  postgres: {
    start: '/etc/database-pool/postgresql_start.sh',
  },
};

const server = http.createServer((req, res) => {
  const [_, dbServer, action] = req.url.split('/');

  if (scripts[dbServer] && scripts[dbServer][action]) {
    const child = spawn(scripts[dbServer][action]);

    child.stdout.on('data', (chunk) => {
      res.write(chunk);
    });
    child.on('close', (code) => {
      if (code === 0) {
        res.write(`\n${dbServer} is now running\n`);
      }
      res.end();
    });
  } else {
    res.writeHead(404);
    res.end();
  }
});

server.listen(PORT, () => {
  console.log(`Database Pool server is listening on port ${PORT}`);
});
