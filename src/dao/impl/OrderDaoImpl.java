package dao.impl;

import bean.Order;
import bean.OrderItem;
import bean.Page;
import dao.OrderDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DruidUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @author GFS
 */
public class OrderDaoImpl implements OrderDao {

    private QueryRunner runner = new QueryRunner(DruidUtils.getDataSource());

    @Override
    public int insertOrder(Order order) throws SQLException {
        QueryRunner runnerSameConnection = new QueryRunner();
        runnerSameConnection.update(DruidUtils.getConnection(true), "insert into t_order values(null, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                order.getOrderNum(), order.getTotalPrice(), order.getReceiverName(), order.getReceiverMobile(),
                order.getReceiverAddress(), order.getPayStatus(), order.getOrderTime(),
                order.getUid(), order.getUsername());

        return 1;
    }

    @Override
    public int insertOrderItem(OrderItem orderItem) throws SQLException {
        QueryRunner runnerSameConnection = new QueryRunner();
//            int i = 1 / 0;
        runnerSameConnection.update(DruidUtils.getConnection(true), "insert into t_orderItem values (null, ?, ?, ?, ?)",
                orderItem.getUid(), orderItem.getPid(), orderItem.getProductCount(), orderItem.getOrderNum());
        return 1;
    }

    @Override
    public List<Order> listOrdersByUid(int uid) {
        List<Order> orderList = null;
        try {
            orderList = runner.query("select * from t_order where uid = ? order by orderId desc", new BeanListHandler<>(Order.class), uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public List<Order> listPageOrders(int currentPageNum) {
        List<Order> orderList = null;
        try {
            orderList = runner.query("select * from t_order order by orderId desc limit ? offset ?",
                    new BeanListHandler<>(Order.class), Page.getPageSize(), (currentPageNum - 1) * Page.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public int countTotalOrderCount() {
        Long totalCount = 0L;
        try {
            totalCount = (Long) runner.query("select count(orderId) from t_order", new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCount.intValue();
    }

    @Override
    public List<OrderItem> listOrderItems(String orderNum) throws SQLException {
        return runner.query("select oi.orderItemId, oi.uid, oi.pid, oi.productCount, oi.orderNum, p.productName, p.imgUrl, p.webStorePrice " +
                        "from t_orderItem oi left join t_product p on oi.pid = p.id where oi.orderNum = ?",
                new BeanListHandler<>(OrderItem.class), orderNum);
    }

    @Override
    public int deleteSelectedCartItems(String sql) throws SQLException {
        QueryRunner runnerSameConnection = new QueryRunner();
//            int i = 1 / 0;
        runnerSameConnection.update(DruidUtils.getConnection(true), sql);
        return 1;
    }

    @Override
    public int updatePayStatus(int orderId, int payStatus) {
        try {
            runner.update("update t_order set payStatus = ? where orderId = ?", payStatus, orderId);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @Override
    public List<OrderItem> listCancellingOrderItems(int orderId) {
        List<OrderItem> orderItemList = null;
        try {
            orderItemList = runner.query("select * from t_orderItem oi inner join t_order o on oi.orderNum = o.orderNum where o.orderId = ?",
                    new BeanListHandler<>(OrderItem.class), orderId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItemList;
    }
}
