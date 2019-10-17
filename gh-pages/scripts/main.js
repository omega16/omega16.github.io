

function add_h_links(collection){
    for (i = 0; i < collection.length; i++) {
        h=collection.item(i)
        var link = document.createElement("a");
        link.appendChild(document.createTextNode("top"));
        link.href = "#TOC";
        link.className+=" top-link";
        h.appendChild(link);
    }
    
}


var blog_entry = document.getElementsByClassName("blog-entry")[0];

var blog_h2 = blog_entry.getElementsByTagName("h2");

add_h_links(blog_h2)