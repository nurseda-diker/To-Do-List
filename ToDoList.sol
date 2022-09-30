//SPDX-License-Identifier:MIT

pragma solidity ^0.8.3;
//Insert,update,read from array structs

contract ToDoList{
    struct ToDo{
        string text;
        bool completed;
    }

    ToDo[] public todos;
    //todos array oluşturma
    function create(string calldata _text) external {
        todos.push(ToDo({
            text:_text,
            completed:false
        }));
    }

    //yapılacakları güncelleme
    function updateText(uint _index,string calldata _text) external {
        todos[_index].text=_text;
    }


    function get(uint _index) external view returns (string memory,bool){
        // storage - 29397 gas --- daha ucuz seçenek
        // memory - 29480 gas
        ToDo memory todo = todos[_index];
        return (todo.text,todo.completed);
    }

    //tamamlanma durumunu güncelleme
    function toggleCompleted(uint _index) external {
        todos[_index].completed=!todos[_index].completed;
    }

}

