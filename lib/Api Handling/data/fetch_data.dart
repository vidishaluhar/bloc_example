import 'dart:convert';

import 'package:bloc_example/Api%20Handling/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchData
{
    Future<List<DataModel>> fetchDataFromApi() async
    {
        final url=Uri.parse("https://jsonplaceholder.typicode.com/posts");
        try
            {
                final response=await http.get(url);
                debugPrint("${response.statusCode}");
                if(response.statusCode==200)
                    {
                        final data=jsonDecode(response.body) as List;
                        return data.map((e) => DataModel.fromMap(e),).toList();
                    }
                else
                    {
                        debugPrint("failed to fetch data from Api");
                        return [];
                    }
            }
            catch(e)
        {
            debugPrint("Error while fetching data from API : $e");
            return [];
        }
    }
}