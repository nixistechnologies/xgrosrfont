final getCategoryQuery = """
query{
  categorys{
    edges{
      node{
        id
        name
        image
      }
    }
  }
}
""";