'use strict';

const RelationController = require('./Relation');

class ChallengeExerciseController extends RelationController {
  constructor(ctx) {
    super(ctx);
    this.model = ctx.model.ChallengeExercise;
  }
}

module.exports = ChallengeExerciseController;
