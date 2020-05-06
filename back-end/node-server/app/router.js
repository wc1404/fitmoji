'use strict';

module.exports = app => {
  const { router, controller } = app;
  router.post('/api/auth/login', controller.auth.login);
  router.get('/api/auth/check', controller.auth.check);
  router.post('/api/auth/signup', controller.users.create);
  router.get('/api/challenge-exercise', controller.chex.index);
  router.post('/api/challenge-exercise', controller.chex.create);
  router.get('/api/challenge-exercise/show', controller.chex.show);
  router.put('/api/challenge-exercise/', controller.chex.update);
  router.delete('/api/challenge-exercise/', controller.chex.destroy);
  router.resources('users', '/api/users', controller.users);
  router.resources('exercise', '/api/exercise', controller.exercise);
  router.resources('challenge', '/api/challenge', controller.challenge);
  router.get('/api/friend', controller.friend.index);
  router.post('/api/friend', controller.friend.create);
  router.get('/api/friend/show', controller.friend.show);
  router.put('/api/friend/', controller.friend.update);
  router.delete('/api/friend/', controller.friend.destroy);
  router.get('/api/participants', controller.participants.index);
  router.post('/api/participants', controller.participants.create);
  router.get('/api/participants/show', controller.participants.show);
  router.put('/api/participants/', controller.participants.update);
  router.delete('/api/participants/', controller.participants.destroy);
};
