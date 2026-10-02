using Microsoft.VisualStudio.TestTools.UnitTesting;

[TestClass]
public class RegistrationValidationTests
{
    [TestMethod]
    public void ValidateStudentEmail_ValidDomain_ReturnsTrue()
    {
        string email = "student@univ.edu.ph";
        bool isValid = email.EndsWith("@univ.edu.ph");
        Assert.IsTrue(isValid, "The student email domain validation failed.");
    }

    [TestMethod]
    public void ValidateSeatAvailability_HasCapacity_ReturnsTrue()
    {
        int capacity = 50;
        int currentRegistrations = 42;
        bool hasSpace = currentRegistrations < capacity;
        Assert.IsTrue(hasSpace, "Capacity limit logic check failed.");
    }
}