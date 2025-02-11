<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.User"%>
<%@page import="com.hms.beans.MedicationList"%>
<%@page import="com.hms.beans.PredicamentList"%>
<%@ include file="validationAdministrator.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="HeadResources.jsp"%>
</head>

<body>
	<%@ include file="Header.jsp"%>
	<%@ include file="SideNav.jsp"%>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>System Administration</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">System Administration</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Add Account Modal Button Card-->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card customers-card">

								<div class="card-body">
									<h5 class="card-title">
										<span></span>
									</h5>

									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#addAccountModal">
										<i class="bi bi-collection">Add Account </i>
									</button>

									<div class="modal" id="addAccountModal">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<form action="/hms/AddAccount" method="post" class="mx-3">
													<!-- Modal header -->
													<div class="modal-header">
														<h5 class="modal-title">Add Account Form</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<div class="form-group row">
															<label for="inputName3" class="col-sm-3 col-form-label">Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="name"
																	name="name" placeholder="Name" required>
															</div>
														</div>
														<div class="form-group row">
															<label for="inputEmail3" class="col-sm-3 col-form-label">Email</label>
															<div class="col-sm-9">
																<input type="email" class="form-control"
																	id="inputEmail3" name="email" placeholder="Email">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputPassword3"
																class="col-sm-3 col-form-label">Password</label>
															<div class="col-sm-9">
																<input type="password" class="form-control"
																	id="inputPassword3" name="password">
																<!-- An element to toggle between password visibility -->
																<input type="checkbox" onclick="myFunction()">Show
																Password
															</div>

														</div>

														<div class="form-group row">
															<label for="inputIC3" class="col-sm-3 col-form-label">Identification
																Card No.</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputIC3"
																	name="ic" placeholder="IC Number" required
																	pattern="[0-9]{12}"
																	title="Please enter a 12-digit number without ' - '.">
															</div>
														</div>
														<div class="form-group row">
															<label for="gender" class="col-sm-3 col-form-label">Gender</label>
															<div class="col-sm-9">
																<select class="form-select" id="gender" name="gender"
																	aria-label="Gender">
																	<option value="Male">Male</option>
																	<option value="Female">Female</option>
																</select>
															</div>
														</div>

														<div class="form-group row">
															<label for="inputdob3" class="col-sm-3 col-form-label">Date
																of Birth</label>
															<div class="col-sm-9">
																<input type="date" class="form-control" id="date"
																	name="dateofbirth" required>
																<div id="dateofbirthError" style="color: red;"></div>
															</div>
														</div>

														<script>
															document
																	.getElementById(
																			'dateofbirth')
																	.addEventListener(
																			'input',
																			function() {
																				var selectedDate = new Date(
																						this.value);
																				var currentDate = new Date();
																				var dateError = document
																						.getElementById('dateofbirthError');

																				if (selectedDate > currentDate) {
																					dateError.textContent = "";
																					this
																							.setCustomValidity("Date of birth cannot be later than current date.");
																				} else {
																					dateError.textContent = "";
																					this
																							.setCustomValidity("");
																				}
																			});
														</script>


														<div class="form-group row">
															<label for="inputphonenum"
																class="col-sm-3 col-form-label">Phone Number</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="inputphonenum" name="phonenumber"
																	placeholder="Phone Number" required
																	pattern="[0-9]{1,15}"
																	title="Please enter a maximum of 15-digit number without ' - ' or any non-numeric characters.">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputnationality"
																class="col-sm-3 col-form-label">Nationality</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="inputnationality" name="nationality"
																	placeholder="Nationality" required pattern="[A-Za-z\s]"
																	title="Please enter only letters and spaces. Numbers are not allowed.">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputAddress3"
																class="col-sm-3 col-form-label">Address</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="streetAddress" name="streetAddress"
																	placeholder="Street Address" required> <input
																	type="text" class="form-control" id="city" name="city"
																	placeholder="City" required> <input type="text"
																	class="form-control" id="state" name="state"
																	placeholder="State" required> <input
																	type="text" class="form-control" id="postcode"
																	name="postcode" placeholder="Postcode" required
																	pattern="[0-9]+">
															</div>
														</div>
														<div class="form-group row">
															<label for="accesslevel" class="col-sm-3 col-form-label">Access
																Level</label>
															<div class="col-sm-9">
																<select class="form-select" id="accesslevel"
																	name="accesslevel" aria-label="accesslevel">
																	<option value="0">Administrator</option>
																	<option value="2">Doctor</option>
																	<option value="1">Nurse</option>
																</select>
															</div>
														</div>
													</div>

													<!-- Modal Footer -->
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Save
															changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Add Account Modal Button Card -->


						<!-- Medication Modal Button Card-->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card customers-card">

								<div class="card-body">
									<h5 class="card-title">
										<span></span>
									</h5>

									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#addMedicationModal">
										<i class="bi bi-capsule-pill">Add Medication</i>
									</button>

									<div class="modal" id="addMedicationModal">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<form method="post" action="/hms/AddMedication">
													<!-- Modal header -->
													<div class="modal-header">
														<h5 class="modal-title">Medication List Form</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<div class="form-group row">
															<label for="inputNameMedication"
																class="col-sm-3 col-form-label">Medication Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="medicationItem" name="medicationItem"
																	placeholder="Medication Name" required>
															</div>
														</div>
													</div>

													<!-- Modal Footer -->
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Save
															changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Medication Modal Button Card -->


						<!-- Predicament Modal Button Card-->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card customers-card">

								<div class="card-body">
									<h5 class="card-title">
										<span></span>
									</h5>

									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#addPredicamentModal">
										<i class="bi bi-bandaid">Add Predicament</i>
									</button>

									<div class="modal" id="addPredicamentModal">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<form method="post" action="/hms/AddPredicament">
													<!-- Modal header -->
													<div class="modal-header">
														<h5 class="modal-title">Predicament List Form</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<div class="form-group row">
															<label for="inputNameMedication"
																class="col-sm-3 col-form-label">Predicament Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="predicament_name" name="predicament_name"
																	placeholder="Predicament Name" required>
															</div>
														</div>
													</div>

													<!-- Modal Footer -->
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Save
															changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Predicament Modal Button Card -->


						<!-- User Masterdata -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Sort</h6>
										</li>
										<li><a class="dropdown-item zone" href="#">All</a></li>
										<li><a class="dropdown-item zone" href="#">Administrator</a></li>
										<li><a class="dropdown-item zone" href="#">Doctor</a></li>
										<li><a class="dropdown-item zone" href="#">Nurse</a></li>
									</ul>
								</div>

								<script>
									$(document)
											.ready(
													function() {
														// Function to handle filter select change
														$("#filterSelect")
																.change(
																		function() {
																			var filterOption = $(
																					this)
																					.val();// Get the selected filter option

																			// Loop through table rows and show/hide based on the selected option
																			$(
																					"#userListTable tbody tr")
																					.each(
																							function() {
																								var status = $(
																										this)
																										.find(
																												"td:eq(3)")
																										.text()
																										.trim(); // Assuming the status is in the 4th column (index 3)

																								if (filterOption === "all"
																										|| filterOption === status
																												.toLowerCase()
																												.replace(
																														" ",
																														"")) {
																									$(
																											this)
																											.show(); // Show the row
																								} else {
																									$(
																											this)
																											.hide(); // Hide the row
																								}
																							});
																		});

														// Function to handle dropdown item click for sorting
														$(".zone")
																.click(
																		function(
																				e) {
																			e
																					.preventDefault();

																			// Get the selected filter option text
																			var filterOption = $(
																					this)
																					.text()
																					.toLowerCase();

																			// Loop through table rows and show/hide based on the selected option
																			$(
																					"#userListTable tbody tr")
																					.each(
																							function() {
																								var status = $(
																										this)
																										.find(
																												"td:eq(3)")
																										.text()
																										.trim()
																										.toLowerCase(); // Assuming the status is in the 4th column (index 3)

																								if (filterOption === "all"
																										|| filterOption === status) {
																									$(
																											this)
																											.show(); // Show the row
																								} else {
																									$(
																											this)
																											.hide(); // Hide the row
																								}
																							});
																		});
													});
								</script>

								<div class="card-body">
									<h5 class="card-title">
										User Account <span>| Masterdata</span>
									</h5>

									<table id="userListTable"
										class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">ID.</th>
												<th scope="col">Name</th>
												<th scope="col">Gender</th>
												<th scope="col">Role</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<User> ul = (ArrayList<User>) session.getAttribute("UserData");
											for (User u : ul) {
											%>
											<tr>
												<td><%=u.getIc()%></td>
												<td><%=u.getName()%></td>
												<td><%=u.getGender()%>
													<div class="modal" id="viewAccountModal<%=u.getId()%>">
														<div class="modal-dialog modal-dialog-centered modal-lg">
															<div class="modal-content">
																<!-- Modal header -->
																<div class="modal-header">
																	<h5 class="modal-title">View Account</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>

																<!-- Modal body -->
																<div class="modal-body">
																	<div class="form-group row">
																		<label for="inputName3"
																			class="col-sm-3 col-form-label">Name</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="name"
																				name="name" value="<%=u.getName()%>"
																				placeholder="Name" disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputEmail3"
																			class="col-sm-3 col-form-label">Email</label>
																		<div class="col-sm-9">
																			<input type="email" class="form-control" id="email"
																				name="email" value="<%=u.getEmail()%>"
																				placeholder="Email" disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputPassword3"
																			class="col-sm-3 col-form-label">Password</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="password"
																				name="password" value="<%=u.getPassword()%>"
																				disabled>
																		</div>

																	</div>

																	<div class="form-group row">
																		<label for="inputIC3" class="col-sm-3 col-form-label">Identification
																			Card No.</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="ic"
																				name="ic" value="<%=u.getIc()%>"
																				placeholder="IC Number" disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="gender" class="col-sm-3 col-form-label">Gender</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="gender"
																				name="gender" value="<%=u.getGender()%>"
																				placeholder="IC Number" disabled>
																		</div>
																	</div>

																	<div class="form-group row">
																		<label for="inputdob3" class="col-sm-3 col-form-label">Date
																			of Birth</label>
																		<div class="col-sm-9">
																			<input type="date" class="form-control"
																				id="dateofbirth" name="dateofbirth"
																				value="<%=u.getDateofbirth()%>" disabled>
																		</div>
																	</div>

																	<div class="form-group row">
																		<label for="inputphonenum"
																			class="col-sm-3 col-form-label">Phone Number</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="phonenumber" name="phonenumber"
																				placeholder="Phone Number"
																				value="<%=u.getDateofbirth()%>" disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputnationality"
																			class="col-sm-3 col-form-label">Nationality</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="nationality" name="nationality"
																				placeholder="Nationality"
																				value="<%=u.getNationality()%>" disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputAddress3"
																			class="col-sm-3 col-form-label">Address</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="streetAddress" name="streetAddress"
																				placeholder="Street Address" required
																				value="<%=u.getAddress()%>" disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="accesslevel"
																			class="col-sm-3 col-form-label">Role</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="accesslevel" name="accesslevel"
																				placeholder="Access level" required
																				value="<%=u.getRole()%>" disabled>
																		</div>
																	</div>
																</div>

																<!-- Modal Footer -->
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div></td>
												<%
												if (u.getAccessLevel() == 0) {
												%>
												<td><span class="badge bg-primary"><%=u.getRole()%></span></td>
												<%
												} else if (u.getAccessLevel() == 1) {
												%>
												<td><span class="badge bg-secondary"><%=u.getRole()%></span></td>
												<%
												} else {
												%><td><span class="badge bg-info"><%=u.getRole()%></span></td>
												<%
												}
												%>
												<td scope="row"><a href="#" data-bs-toggle="modal"
													data-bs-target="#viewAccountModal<%=u.getId()%>">More
														Detail</a></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End User Masterdata -->



					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">

					<!-- Medication List -->
					<div class="card">

						<div class="card-body">
							<h5 class="card-title">
								Medication List <span>| Index</span>
							</h5>

							<div class="medicationlist">

								<table id="medicationListTable"
									class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Medication</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<MedicationList> ml = (ArrayList<MedicationList>) session.getAttribute("MedicationListListData");
										for (MedicationList m : ml) {
										%>
										<tr>
											<td><%=m.getMedicationList_id()%></td>
											<td><%=m.getMedicationItem()%></td>
											<td><a href="#" data-bs-toggle="modal"
												data-bs-target="#editMedicationModal<%=m.getMedicationList_id()%>">Edit</a>
												<div class="modal"
													id="editMedicationModal<%=m.getMedicationList_id()%>">
													<div class="modal-dialog modal-dialog-centered modal-lg">
														<div class="modal-content">
															<form method="post" action="/hms/EditMedication">
																<!-- Modal header -->
																<div class="modal-header">
																	<h5 class="modal-title">Medication List Form</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>

																<!-- Modal body -->
																<div class="modal-body">
																	<div class="form-group row">
																		<label for="inputNameMedication"
																			class="col-sm-3 col-form-label">Medication
																			Name</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="medicationItemEDIT" 
																				name="medicationItemEDIT"
																				placeholder="Medication Name"
																				value="<%=m.getMedicationItem()%>" required>
																			<input type="hidden" class="form-control"
																				id="medicationList_id" name="medicationList_id"
																				value="<%=m.getMedicationList_id()%>">
																		</div>
																	</div>
																</div>

																<!-- Modal Footer -->
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																	<button type="submit" class="btn btn-primary">Save
																		changes</button>
																</div>
															</form>
														</div>
													</div>
												</div></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Medication List -->

					<!-- Predicament List -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								Predicament List <span>| Index</span>
							</h5>

							<div class="predicamentlist">

								<table id="predicamentListTable"
									class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Predicament</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<PredicamentList> pl = (ArrayList<PredicamentList>) session.getAttribute("PredicamentListListData");
										for (PredicamentList p : pl) {
										%>
										<tr>
											<td><%=p.getPredicamentList_id()%></td>
											<td><%=p.getPredicament_name()%></td>
											<td><a href="#" data-bs-toggle="modal"
												data-bs-target="#editPredicamentModal<%=p.getPredicamentList_id()%>">Edit</a>
												<div class="modal"
													id="editPredicamentModal<%=p.getPredicamentList_id()%>">
													<div class="modal-dialog modal-dialog-centered modal-lg">
														<div class="modal-content">
															<form method="post" action="/hms/EditPredicament">
																<!-- Modal header -->
																<div class="modal-header">
																	<h5 class="modal-title">Predicament List Form</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>

																<!-- Modal body -->
																<div class="modal-body">
																	<div class="form-group row">
																		<label for="inputNameMedication"
																			class="col-sm-3 col-form-label">Predicament
																			Name</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="predicament_nameEDIT"
																				name="predicament_nameEDIT"
																				placeholder="Predicament Name"
																				value="<%=p.getPredicament_name()%>" required>
																			<input type="hidden" class="form-control"
																				id="predicamentList_id" name="predicamentList_id"
																				value="<%=p.getPredicamentList_id()%>">
																		</div>
																	</div>
																</div>

																<!-- Modal Footer -->
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																	<button type="submit" class="btn btn-primary">Save
																		changes</button>
																</div>
															</form>
														</div>
													</div>
												</div></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- End Predicament List -->

				</div>
				<!-- End Right side columns -->
			</div>
		</section>

	</main>
	<!-- End #main -->

	<%@ include file="Footer.jsp"%>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<%@ include file="ScriptResources.jsp"%>
	<script>
		// Get the input element
		var datetimeLocal = document.getElementById('datetime-local');

		// Set the value of the input element to the current date and time
		datetimeLocal.value = new Date().toISOString().substring(0, 16);

		function myFunction() {
			var x = document.getElementById("inputPassword3");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
		function search() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("search-input");
			filter = input.value.toUpperCase();
			table = document.getElementById("userListTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
			table = document.getElementById("medicationListTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
			table = document.getElementById("predicamentListTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

</body>

</html>