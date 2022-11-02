function sliceTree(start, end, tree = []) {
    let node = document.getElementById(String(end));
    if (+end < +start || !node) return undefined;
    tree.unshift(node.tagName)
    let parentId = node.parentNode.getAttribute('id');
    if (String(start) === String(end)) return tree;
    return sliceTree(start, parentId, tree);
}