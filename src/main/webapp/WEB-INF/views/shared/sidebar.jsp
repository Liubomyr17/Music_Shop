<div class="logo">
<img src="https://s3.eu-central-1.amazonaws.com/listmusor/production/41481/logo/big/5923c6bba5bb9.jpg?1309784296" alt="GZIMO"
class="image-md-left">
</div>

<div class="list-group">

    <c:forEach items="${categories}" var="category">
        <a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item">${category.name}</a>
    </c:forEach>
</div>