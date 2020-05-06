'use strict';

const BaseController = require('./Base');

class RelationController extends BaseController {
  async show() {
    const res = await this.model.findOne({ where: this.ctx.query });
    if (!res) {
      this.notfound();
      return;
    }
    this.success(res);
  }
  async update() {
    const ctx = this.ctx;
    const res = await this.model.update(ctx.request.body, {
      where: this.ctx.query,
    });

    this.success(res);
  }
  async destroy() {
    const res = await this.model.destroy({ where: this.ctx.query });
    this.success(res);
  }
}

module.exports = RelationController;
