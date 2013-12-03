describe('TodoList.Models.Task', function(){
	it('should be defined', function(){
		expect(TodoList.Models.Task).toBeDefined();
	});

	it('can be instantiated', function(){
		var task = new TodoList.Models.Task();
		expect(task).not.toBeNull();
	});
});