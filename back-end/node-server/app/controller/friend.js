'use strict';

const RelationController = require('./Relation');

class FriendController extends RelationController {
  constructor(ctx) {
    super(ctx);
    this.model = ctx.model.Friend;
  }
}

module.exports = FriendController;
