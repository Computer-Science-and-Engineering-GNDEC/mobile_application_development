# Practical-7
#  Write a code that draws basic graphical primitives on the screen
![Sample Image](./practical7.jpeg)
```
import React from 'react';
import { View, StyleSheet } from 'react-native';

const DrawingPrimitives = () => {
  return (
    <View style={styles.container}>
      {/* Draw a Rectangle */}
      <View style={styles.rectangle} />

      {/* Draw a Circle */}
      <View style={styles.circle} />

      {/* Draw a Line */}
      <View style={styles.line} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  rectangle: {
    width: 100,
    height: 50,
    backgroundColor: 'red',
    borderWidth: 2,
    borderColor: 'black',
    marginBottom: 20,
  },
  circle: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: 'blue',
    borderWidth: 2,
    borderColor: 'black',
    marginBottom: 20,
  },
  line: {
    width: 200,
    height: 2,
    backgroundColor: 'green',
  },
});

export default DrawingPrimitives;
