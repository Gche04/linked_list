
class Node
    attr_accessor :content, :next_node
    def initialize(val, next_node = nil)
        @content = val
        @next_node = next_node
    end
end

class LinkedList

    def initialize
        @head = nil
    end

    def append(value)      
        if @head == nil
            @head = Node.new(value)
        else
            tail_node.next_node = Node.new(value)
        end             
    end

    def prepnd(value)

        if @head == nil
            @head = Node.new(value)
        else
            hold_node = @head
            @head = Node.new(value, hold_node)
        end             
    end

    def size
        count = 0
        if @head == nil
            return count
        else
            current_node = @head

            while current_node
                count += 1
                current_node = current_node.next_node
            end
        end
        count
    end

    def head
        @head.content        
    end

    def tail
        tail_node.content
    end

    def at(index)
        count = 0
        if @head == nil
            return "empty list"
        else
            current_node = @head

            while current_node
                return current_node.content if count == index
                count += 1
                current_node = current_node.next_node
            end
        end
    end

    def pop
        return "empty list" if @head == nil

        node = @head
        while node.next_node.next_node
            node = node.next_node
        end
        node.next_node = nil
    end

    def contains?(value)
        return "empty list" if @head == nil

        node = @head
        while node.next_node
            
            node = node.next_node
            return true if value == node.content
        end
        return false
    end

    def find(value)
        count = 0
        if @head == nil
            return nil
        else
            current_node = @head

            while current_node
                return count if current_node.content == value
                count += 1
                current_node = current_node.next_node
            end
            return nil
        end
    end

    def to_s
        string = ""
        current_node = @head
        while current_node 
            string += "( #{current_node.content} ) -> \n" 
            current_node = current_node.next_node
        end
        string += "nil"
    end

    def insert_at(value, index)
        if specific_node(index) == 1
            prepnd(value)
        else
            hold_node = specific_node(index).next_node
            specific_node(index).next_node = Node.new(value, hold_node)
        end      
    end

    def remove_at(index)
        if specific_node(index) == 1
            @head = @head.next_node
        else
            specific_node(index).next_node = specific_node(index).next_node.next_node 
        end
    end

    def specific_node(index)
        #node before given index
        return 1 if index-1 < 0
        count = 0
        index -= 1
        current_node = @head

        while current_node
            return current_node if count == index
            count += 1
            current_node = current_node.next_node
        end
    end

    def tail_node
        node = @head
        while node.next_node
            node = node.next_node
        end
        node    
    end
end


=begin
list = LinkedList.new
list.append("fred")
list.append("ada")
list.append("gche")
list.append("jams")


puts list.size
puts list.to_s
puts ""

list.prepnd("ray")
puts list.size
puts list.to_s
puts ""

puts list.head
puts list.tail
puts list.at(3)
list.pop
puts ""

puts list.size
puts list.to_s
puts list.contains?("gche")
puts list.find("gche")
puts ""

list.insert_at("stu", 3)
puts list.to_s
puts list.find("gche")
puts list.find("stu")

list.remove_at(3)
puts list.to_s
