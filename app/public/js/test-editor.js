class TestEditor {
    constructor(groups) {
        this.id = 0;
        this.groups = [];
        const template = document.querySelector("#test-editor");
        this.component = template.content.cloneNode(true);
        
        this.group_container = this.component.querySelector(".group-container");
        const add_group = this.component.querySelector("button");

        for(const group of groups)
            this.addGroup(group);
        
        add_group.onclick = () => this.addGroup({name: "", tasks: []});
        
    }

    addGroup(task_group_data) {
        const group = new TaskGroup(task_group_data, ()=>{
            const index = this.groups.indexOf(group);
            this.groups.splice(index, 1);
            for(const node of group.nodes)
                node.remove();
        }, this.id);
        this.id++;
        for(const node of group.nodes)
            this.group_container.appendChild(node);
    }

}

class TaskGroup {
    constructor(task_group_data, on_delete, id) {
        this.tasks = [];
        const template = document.querySelector("#task-group");
        const component = template.content.cloneNode(true);

        this.tab = component.querySelector("tbody");
        const delete_group = component.querySelectorAll("button")[3];
        const add_task = component.querySelectorAll("button")[3];
        const remove = component.querySelectorAll("button")[2];
        component.querySelectorAll("button")[0].setAttribute("data-bs-target", "#group-"+id);
        component.getElementById("group-1").setAttribute("id", "group-" + id);

        for(const task_data of task_group_data.tasks) {
            this.addTask(task_data);
        }

        add_task.onclick = () => this.addTask({});
        remove.onclick = on_delete;
        this.nodes = Array.prototype.slice.call(component.childNodes);
    }

    addTask(task_data) {
        const task = new Task(task_data, () => {
            const index = this.tasks.indexOf(task);
            this.tasks.splice(index, 1);
            for(const node of task.nodes)
                node.remove();
        });
        for(const node of task.nodes)
            this.tab.appendChild(node);

    }
}

class Task {
    constructor(task_data, on_delete) {
        const template = document.querySelector("#task");
        const component = template.content.cloneNode(true);
        const spans = component.querySelectorAll("span");

        this.points = spans[0]; 
        this.name = spans[1]; 
        this.time = spans[2]; 
        this.memory = spans[3]; 
        this.show_output = component.querySelector("input"); 
        this.URI = spans[4];

        this.points.textContent = task_data.points;
        this.name.textContent = task_data.name;
        this.time.textContent = task_data.time;
        this.memory.textContent = task_data.memory;
        this.URI.textContent = task_data.URI;
        if(task_data.show_output) this.show_output.setAttribute("checked", "true");

        component.querySelector("button").onclick = on_delete;
        this.nodes = Array.prototype.slice.call(component.childNodes);
    }
}

let editor = new TestEditor([{
    name: "Group 1",
    tasks: [{
        points: 1.0,
        name: "01-small",
        time: "3s",
        memory: "1M",
        show_output: true,
        URI: "tests/01"
    }]
}]);

document.getElementById("editor").appendChild(editor.component);
