const nats = require('nats').connect('nats://nats_1:4222');

nats.subscribe('get.example.model', (req, reply) => {
  nats.publish(reply, JSON.stringify({ result: { model: { message: "Hello, World!"}}}));
  console.log('Here we go, another  GET');
});

nats.subscribe('access.example.model', (req, reply) => {
  nats.publish(reply, JSON.stringify({ result: { get: true }}));
});
