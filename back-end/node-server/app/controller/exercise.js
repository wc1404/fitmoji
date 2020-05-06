'use strict';

const BaseController = require('./Base');

class ExerciseController extends BaseController {
  constructor(ctx) {
    super(ctx);
    this.model = ctx.model.Exercise;
  }
}

module.exports = ExerciseController;
