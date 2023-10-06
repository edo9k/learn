
from sklearn.datasets import load_iris
from sklearn.neighbors import KNeighborsClassifier

iris = load_iris()

# 
# print("iris dataset data type: ")
# print(type(iris))
# 
# print("iris data itself") 
# print(iris.data) 
# 
# print("iris feature names")
# print(iris.feature_names)
# 
# print("iris targets")
# print(iris.target)
# 
# print("iris target names") 
# print(iris.target_names) 
# 
# print("iris data and target types")
# print(type(iris.data), type(iris.target))
# 
# print("iris data and target shape")
# print(iris.data.shape)
# print(iris.target.shape)
#  

# feature matrix in X
X = iris.data

# response vector in Y
y = iris.target

knn = KNeighborsClassifier(n_neighbors=1) 
knn.fit(X, y) 

new_item = [[3, 5, 4, 2]]

prediction = knn.predict(new_item) 

print(f"the new item {new_item} is predicted to be a { iris.target_names[prediction[0]] }")
