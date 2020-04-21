<div class="container">

    <div class="row">

        <!-- Would be to display sidebar -->
        <div class="col-md-3">

            <%@include file="./shared/sidebar.jsp" %>

        </div>
        <!-- to display the actual products -->
        <div class="col-md-9">
            <!-- Added breadcrumb component -->
            <div class="row">



                <div class="col-lg-12">

                    <c:if test="${userClickAllProducts == true}">

                        <script>
                            window.categoryId = '';
                        </script>

                        <ol class="breadcrumb">
                            <thread>
                                <tr>
                                    <th><a href="${contextRoot}/home">Home </a></th>
                                    <th class="active">All Products </th>
                                </tr>
                            </thread>
                        </ol>

                    </c:if>

                    <c:if test="${userClickCategoryProducts == true}">

                        <script>
                            window.categoryId = '${category.id}';
                        </script>

                        <ol class="breadcrumb">
                            <thread>
                                <tr>
                                    <th><a href="${contextRoot}/home">Home</a></th>
                                    <th class="active">Category</th>
                                    <th class="active">${category.name}</th>
                                </tr>
                            </thread>
                        </ol>
                    </c:if>

                </div>
            </div>

            <div class="container-fluid">

                <div class="table-responsive">

                    <table id="productListTable" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Brand</th>
                            <th>Price</th>
                            <th>Qty. Available</th>
                            <th>Options</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Brand</th>
                            <th>Price</th>
                            <th>Qty. Available</th>
                            <th>Options</th>
                        </tr>
                        </tfoot>
                    </table>

                </div>

            </div>


        </div>
    </div>
</div>