'use strict';

const Controller = require('egg').Controller;

function toInt(str) {
  if (typeof str === 'number') return str;
  if (!str) return str;
  return parseInt(str, 10) || 0;
}

class BaseController extends Controller {
  async success(res, code) {
    if (res === null) {
      this.notfound();
      return;
    }
    this.ctx.status = code || 200;
    this.ctx.body = {data: res};
  }
  async notfound(msg, code) {
    this.ctx.status = code || 202;
    this.ctx.body = {
      error_type: 'NotFound',
      msg: msg || 'target is not existed',
    };
  }
  async fail(type, msg) {
    this.ctx.status = 500;
    this.ctx.body = {error_type: type, msg};
  }
  async index() {
    const ctx = this.ctx;
    const query = {
      limit: toInt(ctx.query.limit),
      offset: toInt(ctx.query.offset),
    };
    const res = await this.model.findAll(query);
    this.success(res);
  }

  async show() {
    const ctx = this.ctx;
    const user = await this.model.findByPk(toInt(ctx.params.id));
    this.success(user);
  }

  async create() {
    const ctx = this.ctx;
    const user = await this.model.create(ctx.request.body);
    this.success(user, 201);
  }

  async update() {
    const ctx = this.ctx;
    const id = toInt(ctx.params.id);
    const user = await this.model.findByPk(id);
    if (!user) {
      this.notfound();
      return;
    }

    await user.update(ctx.request.body);
    this.success(user);
  }

  async destroy() {
    const ctx = this.ctx;
    const id = toInt(ctx.params.id);
    const user = await this.model.findByPk(id);
    if (!user) {
      this.notfound();
      return;
    }

    await user.destroy();
    this.success(user);
  }
}

module.exports = BaseController;
