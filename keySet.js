const iterator = {
  *[Symbol.iterator] () {
    for (const k in this) {
      yield [k, this[k]];
    }
  }
}

Object.assign(Object.prototype, iterator);
