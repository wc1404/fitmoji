'use strict';

const BaseController = require('./Base');

class ChallengeController extends BaseController {
  constructor(ctx) {
    super(ctx);
    this.model = ctx.model.Challenge;
  }
}

module.exports = ChallengeController;
