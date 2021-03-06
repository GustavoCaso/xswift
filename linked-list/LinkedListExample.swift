// Foundation not needed

// Apple Swift version 2.0

class Node<T> {
    var value: T? = nil
    var next: Node? = nil
    var prev: Node? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
    
}

class Deque<T> {
    var count: Int = 0
    var head: Node<T>
    var tail: Node<T>
    
    init() {
        self.head = Node<T>()
        self.tail = head
        
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func push(value: T) {
        let node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head.prev = node
            self.head = node
        }
        self.count++
    }
    
    func unshift(value: T) {
        let node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        }
        self.count++
    }
    
    
    
    
    func pop() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            let temp: Node<T> = self.head
            self.count--
            return temp.value
        } else {
            let temp: Node<T> = self.head
            self.head = self.head.next!
            self.count--
            return temp.value
        }
    }
    
    
    func shift() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            let temp: Node<T> = self.tail
            self.count--
            return temp.value
        } else {
            let temp: Node<T> = self.tail
            self.tail = self.tail.prev!
            self.count--
            return temp.value
        }
    }
}

