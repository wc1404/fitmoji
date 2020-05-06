'use strict';

const BaseController = require('./Base');

class UsersController extends BaseController {
  constructor(ctx) {
    super(ctx);
    this.model = ctx.model.Users;
  }
}

module.exports = UsersController;
