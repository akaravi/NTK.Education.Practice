# -*- coding: utf-8 -*-
"""karavi_alireza_patternrecognition_improm_selction_property_1403091222.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1ygt6h7Wc7I0shbxVFlpYYCXmjv57WH3s
"""

# Import necessary libraries
import pandas as pd
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.feature_selection import SelectFromModel
from sklearn.metrics import accuracy_score

# Generate a synthetic dataset with 1000 samples and 10 features
X, y = make_classification(n_samples=1000, n_features=10, n_informative=8, n_redundant=2, random_state=42)

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Define models
models = {
    "Random Forest": RandomForestClassifier(random_state=42),
    "KNN": KNeighborsClassifier(),
    "SVM": SVC(kernel='linear', random_state=42)
}

# Function to evaluate model accuracy
def evaluate_model(model, X_train, X_test, y_train, y_test):
    model.fit(X_train, y_train)
    y_pred = model.predict(X_test)
    return accuracy_score(y_test, y_pred)

# Evaluate models without feature selection
print("Accuracy without feature selection:")
for name, model in models.items():
    accuracy = evaluate_model(model, X_train, X_test, y_train, y_test)
    print(f"{name}: {accuracy:.2f}")

# Perform feature selection using Random Forest
selector = SelectFromModel(RandomForestClassifier(n_estimators=100, random_state=42))
selector.fit(X_train, y_train)

# Transform datasets
X_train_selected = selector.transform(X_train)
X_test_selected = selector.transform(X_test)

# Evaluate models with feature selection
print("\nAccuracy with feature selection:")
for name, model in models.items():
    accuracy = evaluate_model(model, X_train_selected, X_test_selected, y_train, y_test)
    print(f"{name}: {accuracy:.2f}")