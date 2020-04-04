module.exports = class OptimizedMap {
  /**
   * Instanciate a new OptimizedMap
   * @param {Array<[object, any]>} entries Entries to populate the map on instanciation
   */
  constructor(entries) {
    this._wm = new WeakMap(entries);
    this._size = entries.length || 0;
  }

  get size() {
    return this._size;
  }

  /**
   * Set a value for a given key within the map collection
   * @param {object} key The object reference key
   * @param {any} value The value
   * @returns {OptimizedMap}
   */
  set(key, value) {
    if (!this._wm.has(key))
      this._size++;

    this._wm.set(key, value);
    return this;
  }

  /**
   * Get the value corresponding to the given key
   * @param {object} key The object reference key
   * @returns {any}
   */
  get(key) {
    return this._wm.get(key);
  }

  /**
   * Check if a given key is present within the collection
   * @param {object} key The object reference key
   * @returns {boolean}
   */
  has(key) {
    return this._wm.has(key);
  }

  /**
   * Delete the entry corresponding to the given key
   * @param {object} key The object reference key
   * @returns {boolean}
   */
  delete(key) {
    let result = this._wm.delete(key);
    if (result)
      this._size--;
    return result;
  }

  /**
   * Clear the collection map
   * @returns {OptimizedMap}
   */
  clear() {
    this._wm = new WeakMap();
    this._size = 0;
    return this;
  }
};