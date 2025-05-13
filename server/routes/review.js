const express = require('express');
const Review = require('../models/Review');
const authenticate = require('../middleware/authMiddleware');
const router = express.Router();

// Add review
router.post('/', authenticate, async (req, res) => {
  const review = await Review.create({ ...req.body, userId: req.user.id });
  res.json(review);
});

// Get reviews by coffee item
router.get('/:coffeeId', async (req, res) => {
  const reviews = await Review.find({ coffeeId: req.params.coffeeId });
  res.json(reviews);
});

module.exports = router;
