<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Order</th>
                <th>Date</th>
                <th>Status</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>May 10,2018</td>
                <td><span class="success">Completed</span></td>
                <td>$25.00 for 1 item </td>
                <td><a href="cart.html" class="view">view</a></td>
            </tr>
            <tr>
                <td>2</td>
                <td>May 10,2018</td>
                <td>Processing</td>
                <td>$17.00 for 1 item </td>
                <td><a href="cart.html" class="view">view</a></td>
            </tr>
        </tbody>
    </table>
</div>