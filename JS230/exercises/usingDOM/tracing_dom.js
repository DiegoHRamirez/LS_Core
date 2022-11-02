function domTreeTracer(id, tree = []) {
    let node = document.getElementById(String(id));
    let parent = node.parentNode;
    let nodes = [...parent.children].map(node => node.nodeName);
    tree.push(nodes);
    if (String(id) === '1') return tree;
    return domTreeTracer(parent.getAttribute('id'), tree);
}