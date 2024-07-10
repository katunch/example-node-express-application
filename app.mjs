import process from 'node:process';
import express from 'express';

const app = express();

app.get('/', (req, res) => {
  res.send('Hello World!');
});

const server = app.listen(3000, () => {
  console.log('Server is listening on port 3000');
});


const handleExitFn = () => {
  console.log('Closing http server.');
  server.close(() => {
    console.log('Http server closed.');
  });
};

process.on('SIGTERM', handleExitFn);
process.on('SIGINT', handleExitFn);