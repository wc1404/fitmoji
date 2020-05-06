'use strict';

const RelationController = require('./Relation');

class ParticipantsController extends RelationController {
  constructor(ctx) {
    super(ctx);
    this.model = ctx.model.ChallengeParticipants;
  }
}

module.exports = ParticipantsController;
