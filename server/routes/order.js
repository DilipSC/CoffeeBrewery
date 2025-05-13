const express = require('express');
const Order = require('../models/Order');
const authenticate = require('../middleware/authMiddleware');
const router = express.Router();


router.post('/add', authenticate, async (req, res) => {
  const order = await Order.create({ ...req.body, userId: req.user.id });
  res.json(order);
});


router.get('/', authenticate, async (req, res) => {
  const orders = await Order.find({ userId: req.user.id });
  res.json(orders);
});
router.get('/:id', authenticate, async (req, res) => {
    try {
      const order = await Order.findById(req.params.id);
  
      
      if (!order || order.userId.toString() !== req.user.id) {
        return res.status(404).json({ message: 'Order not found or unauthorized' });
      }
  
      res.status(200).json(order);
    } catch (error) {
      res.status(500).json({ message: 'Failed to fetch order', error });
    }
  });
  router.delete('/:id', authenticate, async (req, res) => {
    try {
      const order = await Order.findById(req.params.id);
  
      if (!order || order.userId.toString() !== req.user.id) {
        return res.status(404).json({ message: 'Order not found or unauthorized' });
      }
  
      await order.remove(); // Or Order.findByIdAndDelete(req.params.id)
      res.status(200).json({ message: 'Order cancelled successfully' });
    } catch (error) {
      res.status(500).json({ message: 'Failed to cancel order', error });
    }
  });
  

module.exports = router;
