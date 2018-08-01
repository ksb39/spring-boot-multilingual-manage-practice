<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Sample Two</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/static/lib/jstree/bootstrap-theme/proton/style.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<style>
    .wrapper {position:absolute;top:0;left:0;right:0;bottom:0;}
    .wrapper .left {position:absolute;top:0;left:0;right:50%;bottom:0;}
    .wrapper .right {position:absolute;top:0;left:50%;right:0;bottom:0;}
</style>
<body>
    <div>
        Sample
    </div>
    <div class="wrapper">
        <div class="left"></div>
        <div class="right">
            <div id="m_tree"></div>
            <button id="test">test</button>
        </div>
    </div>
<script>
    var Treeview = function () {
        var jsTree;
        var demo = function () {
            $.ajax('/menu/jsTreeNode', {
                method: 'GET',
                // data: $('[name]').serialize(),
            }).done(function(data) {
                console.log(data);
                jsTree = $('#m_tree').jstree({
                    'plugins': ["wholerow", "checkbox", "types"],
                    'core': {
                        "themes" : {
                            // "responsive": false
                            'name' : 'proton',
                            'responsive' : true
                        },
                        'data': data
                    },
                    "types" : {
                        "default" : {
                            "icon" : "fa fa-folder m--font-warning"
                        },
                        "file" : {
                            "icon" : "fa fa-file  m--font-warning"
                        }
                    },
                });
            }).always(function() {
                console.log("always");
                // setTimeout(function() {
                //     location.reload();
                // }, 600);
            });
        };

        return {
            init: function () {
                demo();
            },
            jsTree: jsTree
        };
    }();

    $(document).ready(function() {
        Treeview.init();
        $( "#test" ).click(function() {
            var v = $('#m_tree').jstree(true).get_json('#', {flat:true})
            var mytext = JSON.stringify(v);
            console.log(mytext);
            alert( "Handler for .click() called." );
        });
    });
</script>
</body>
</html>