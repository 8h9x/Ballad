class BList {
    func addItem(_ item: Any) -> Bool {
        return false
    }

    func addItem(_ item: Any, _ index: Int32) -> Bool {
        return false
    }

    func addList(_ item: BList) -> Bool {
        return false
    }

    func addList(_ item: BList, _ index: Int32) -> Bool {
        return false
    }

    func countItems() -> Int32 {
        return 0
    }

    func doForEach(_ fn: () -> Bool) {

    }

    func doForEach(_ fn: (_ item: Any) -> Bool, _ arg2: Any) {

    }

    func firstItem() -> Any {
        return 0
    }

    func hasItem(_ item: Any) -> Bool {
        return false
    }

    func indexOf(_ item: Any) -> Int32 {
        return 0
    }

    func isEmpty() -> Bool {
        return false
    }

    func itemAt(_ index: Int32) -> Any {
        return 0
    }

    // unsure abt this one, haiku returns a pointer to the item list
    func items() {

    }

    func lastItem() -> Any {
        return 0
    }

    func makeEmpty() {

    }

    func removeItem(_ item: Any) -> Bool {
        return false
    }

    func removeItem(_ index: Int32) -> Any {
        return 0
    }

    // probably more semantically clear to refer to 'index' as 'startIndex'
    func removeItems(_ index: Int32, _ count: Int32) -> Bool {
        return false
    }

    // typical comparitor fn based sort
    func sortItems(_ compareFn: (_ prev: Any, _ next: Any) -> Int) {}
}

/*
Operators
= (assignment)
BList& operator =(const BList& from);
Copies the contents of one BList object into another:

BList newList = oldList;
After the assignment, each object has its own independent copy of list data; destroying one of the objects won't affect the other.

Only the items in the list are copied, not the data they point to.
 */
