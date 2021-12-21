import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jobnow_version_1/screens/admin/home/components/employer/employers_model.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/jobs_model.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/users_model.dart';

class HttpService {
  final String jobsURL = "http://192.168.0.136:8000/api/all_jobs";
  final String deleteURL = "http://192.168.0.136:8000/api/jobs";

  final String jobseekerURL = "http://192.168.0.136:8000/api/jobseeker";
  final String employerURL = "http://192.168.0.136:8000/api/employers";

  Future<List<JobsModel>> getJobs() async {
    Response res = await http.get(Uri.parse(jobsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<JobsModel> jobs = body
          .map(
            (dynamic item) => JobsModel.fromJson(item),
      )
          .toList();

      return jobs;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
  Future<List<JobseekerModel>> getJobseeker() async {
    Response res = await http.get(Uri.parse(jobseekerURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<JobseekerModel> jobseekers = body
          .map(
            (dynamic item) => JobseekerModel.fromJson(item),
      )
          .toList();

      return jobseekers;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
  Future<List<EmployerModel>> getEmployer() async {
    Response res = await http.get(Uri.parse(employerURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<EmployerModel> employers = body
          .map(
            (dynamic item) => EmployerModel.fromJson(item),
      )
          .toList();

      return employers;
    } else {
      throw "Unable to retrieve employers.";
    }
  }
  Future<void> updateJobseeker(int id) async {
    Response res = await http.put(Uri.parse("$jobseekerURL/$id"));

    if (res.statusCode == 200) {
      print("DELETED JOBSEEKERS");
    } else {
      throw "Unable to delete post.";
    }
  }
  Future<void> deleteJobseeker(int id) async {
    Response res = await http.delete(Uri.parse("$jobseekerURL/$id"));

    if (res.statusCode == 200) {
      print("DELETED JOBSEEKERS");
    } else {
      throw "Unable to delete post.";
    }
  }
  Future<void> deleteJob(int id) async {
    Response res = await http.delete(Uri.parse("$deleteURL/$id"));

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }
  Future<void> deleteEmployer(int id) async {
    Response res = await http.delete(Uri.parse("$employerURL/$id"));

    if (res.statusCode == 200) {
      print("DELETED EMPLOYER");
    } else {
      throw "Unable to delete post.";
    }
  }

}