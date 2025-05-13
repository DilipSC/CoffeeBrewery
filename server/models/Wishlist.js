const mongoose = require('mongoose');

const wishlistSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  itemId: String,
  itemName: String
});

module.exports = mongoose.model('Wishlist', wishlistSchema);
